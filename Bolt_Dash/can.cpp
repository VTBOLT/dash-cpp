#include "can.h"

#include <stdio.h>
#include <string.h>

using namespace std::chrono_literals;

std::mutex m;
our_candata data{};

namespace can {
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
                data.bms_error = frame.data[5] & BMS_FAULT_MASK;
                data.pack_current = frame.data[0] + (frame.data[1] << 8);
                data.pack_voltage = frame.data[2] + (frame.data[3] << 8);
                break;
            case can_ids.main_pack_temp:
                data.high_cell_temp = frame.data[0] + (frame.data[1] << 8);
                data.low_cell_temp = frame.data[2] + (frame.data[3] << 8);
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
}
