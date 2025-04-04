#include "can.h"

#include <cstdlib>
#include <stdio.h>
#include <string.h>

using namespace std::chrono_literals;

#define FRAMES_TO_AVERAGE 10
#define CELL_VOLTAGE_SCALING 0.0001
#define SAFEST_HIGH_CELL_VOLTAGE 4.25
#define SAFEST_LOW_CELL_VOLTAGE 3.0

std::mutex m;
our_candata data{};

namespace can {
    // Circular buffers to store the last 10 values of the highest and lowest cell voltages
    int lastLowestCellVoltages[FRAMES_TO_AVERAGE]{};
    int lastHighestCellVoltages[FRAMES_TO_AVERAGE]{};
    int lastLowestCellVoltageIndex = 0;
    int lastHighestCellVoltageIndex = 0;

    // Average lowest and highest cell voltages
    int getAverageLowestCellVoltage() {
        int sum = 0;
        for (int i = 0; i < FRAMES_TO_AVERAGE; i++) {
            sum += lastLowestCellVoltages[i];
        }
        return sum / FRAMES_TO_AVERAGE;
    }
    int getAverageHighestCellVoltage() {
        int sum = 0;
        for (int i = 0; i < FRAMES_TO_AVERAGE; i++) {
            sum += lastHighestCellVoltages[i];
        }
        return sum / FRAMES_TO_AVERAGE;
    }

#ifdef CAN_LIB_FOUND
    int run() {
        // Where the data will be stored to be send to the front end
        int s, i;
        int nbytes;
        struct sockaddr_can addr;
        struct ifreq ifr;
        struct can_frame frame;
        int8_t *unknown_data = nullptr;

        printf("CAN Sockets Receive Demo\r\n");

        // Create a new socket of type CAN using data CAN_RAW
        if ((s = socket(PF_CAN, SOCK_RAW, CAN_RAW)) < 0) {
            perror("Socket");
            return 1;
        }

        // Setting the name of the physical can interface (ip a)
        strcpy(ifr.ifr_name, "can0");
        // Converts if name to actual interface index
        ioctl(s, SIOCGIFINDEX, &ifr);

        // Reserve memory for CAN frames
        memset(&addr, 0, sizeof(addr));
        addr.can_family = AF_CAN; // Use CAN sockets specifically
        addr.can_ifindex = ifr.ifr_ifindex;

        // Connects to the socket and  it locks
        if (bind(s, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
            perror("Bind");
            return 1;
        }

        while (true) {
            // Actually reads from the socket
            nbytes = read(s, &frame, sizeof(struct can_frame));

            // Make sure it exists
            if (nbytes < 0) {
                perror("Read");
                return 1;
            }
            m.lock();
            switch (frame.can_id) {
            case can_ids.aux_battery:
                data.aux_voltage = frame.data[0] + (frame.data[1] << 8);
                data.aux_percent = data.aux_voltage / 2.5;
                break;
            case can_ids.info:
                data.pack_state_of_charge = frame.data[4];
                data.bms_fault = frame.data[5] & BMS_FAULT_MASK;
                data.pack_current = frame.data[0] + (frame.data[1] << 8);
                data.pack_voltage = frame.data[2] + (frame.data[3] << 8);
                break;
            case can_ids.main_pack_temp:
                data.high_cell_temp = frame.data[0] + (frame.data[1] << 8);
                data.low_cell_temp = frame.data[2] + (frame.data[3] << 8);
                break;
            case can_ids.cell_max_min_voltages:
                data.highest_cell_voltage = frame.data[2] + (frame.data[3] << 8);
                data.lowest_cell_voltage = frame.data[4] + (frame.data[5] << 8);
                // Update circular buffers
                lastLowestCellVoltages[lastLowestCellVoltageIndex] = data.lowest_cell_voltage;
                lastHighestCellVoltages[lastHighestCellVoltageIndex] = data.highest_cell_voltage;
                lastLowestCellVoltageIndex = (lastLowestCellVoltageIndex + 1) % FRAMES_TO_AVERAGE;
                lastHighestCellVoltageIndex = (lastHighestCellVoltageIndex + 1) % FRAMES_TO_AVERAGE;
                break;
            case can_ids.motor_temp:
                data.motor_temperature = frame.data[4] + (frame.data[5] << 8);
                break;
            case can_ids.bms_temp:
                data.bms_temperature = frame.data[4] + (frame.data[5] << 8);
                break;
            case can_ids.rpm:
                data.motor_speed = frame.data[2] + (frame.data[3] << 8);
                data.bike_speed = frame.data[2] + (frame.data[3] << 8);
                break;
            case can_ids.speed:
                data.bike_speed = frame.data[2] + (frame.data[3] << 8);
                break;
            case can_ids.mc_temp: {
                uint16_t r1 = frame.data[0] + (frame.data[1] << 8);
                uint16_t r2 = frame.data[2] + (frame.data[3] << 8);
                uint16_t r3 = frame.data[4] + (frame.data[5] << 8);
                data.mc_temperature = r1 > r2 ? r1 : (r2 > r3 ? r2 : r3);
                break;
            };
            case can_ids.mc_faults:
                data.mc_fault = frame.data[0] || frame.data[1] || frame.data[2] || frame.data[3] || frame.data[4] || frame.data[5] || frame.data[6] || frame.data[7];
                break;
            case can_ids.internal_states: {
                // Get state of bike
                uint16_t status = frame.data[0] + (frame.data[1] << 8);
                switch (status) {
                // I don't actually think this does anything, but this may be when accessories exist
                case 0:
                    data.bike_status = 1;
                    break;
                // If 1, 2, or 3, VSM is in one of the precharge states
                case 1:
                case 2:
                case 3:
                    data.bike_status = 2;
                    break;
                // 4 or 5, MC is ready but not active yet
                case 4:
                case 5:
                    data.bike_status = 3;
                    break;
                // 6, Motor is on an can be moved
                case 6:
                    data.bike_status = 4;
                    break;
                // Kind of obsolete b/c this is not a visible status, but if 7, there is a fault
                case 7:
                    data.bike_status = 5;
                    break;
                default:
                    break;
                }
                data.motor_on = frame.data[0] == 6;
                break;
            };
            case can_ids.bms_error_codes:
                // aaaaaaaabbbbbbbbccccccc
                // a: DTC codes 2 bits 9-16
                // b: DTC codes 2 bits 1-8
                // c: DTC codes 1 bits 1-8
                data.bms_error_codes = (frame.data[2]) + (frame.data[0] << 8) + (frame.data[1] << 16);
                data.bms_error = data.bms_error_codes & ALL_BMS_ERRORS;
                data.bms_warning = data.bms_error_codes & ALL_BMS_WARNINGS;

                // Clear warnings if they are no longer relevant
                if (data.bms_error_codes & bms_errors.highest_cell_voltage_too_high && (getAverageHighestCellVoltage() * CELL_VOLTAGE_SCALING) <= SAFEST_HIGH_CELL_VOLTAGE) {
                    data.bms_warning &= ~bms_errors.highest_cell_voltage_too_high;
                }
                if (data.bms_error_codes & bms_errors.lowest_cell_voltage_too_low && (getAverageLowestCellVoltage() * CELL_VOLTAGE_SCALING) >= SAFEST_LOW_CELL_VOLTAGE) {
                    data.bms_warning &= ~bms_errors.lowest_cell_voltage_too_low;
                }
                break;
            case can_ids.acc_signal:
                if (frame.data[0] == 0) {
                    data.bike_status = 0;
                } else if (data.bike_status == 0) {
                    data.bike_status = frame.data[0];
                }
                break;
            default:
                unknown_data = new int8_t[frame.can_dlc];
                for (int i{}; i < frame.can_dlc; i++) {
                    unknown_data[i] = frame.data[i];
                }
            }
            m.unlock();

            // Print the can ID and len of data
            // printf("0x%03X [%d] ", frame.can_id, frame.can_dlc);                // switch (status) {
            // case 0:
            //     break;
            // // If 1, 2, or 3, VSM is in one of the precharge states
            // case 1:
            // case 2:
            // case 3:
            //     data.bike_status = 0;
            //     break;
            // case 5:
            //     data.bike_status = 1;
            //     break;
            // default:
            //     break;
            // }

            // Print the data in the CAN message
            //            for (i = 0; i < frame.can_dlc; i++)
            // printf("%02X ", frame.data[i]);

            // printf("\r\n");
        }

        // Close socket
        if (close(s) < 0) {
            perror("Close");
            return 1;
        }

        return 0;
    }

#else
    int run() {
        // If no CAN library is found, just return 0
        return 0;
    }
#endif // CAN_LIB_FOUND
}
