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
                data.mc_temperature = frame.data[0] + (frame.data[1] << 8);
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
            case can_ids.mc_temp:
                // data.mc_temperature = frame.data[0] + (frame.data[1] << 8);
                break;
            case can_ids.mc_faults:
                data.mc_fault = frame.data[0] || frame.data[1] || frame.data[2] || frame.data[3] || frame.data[4] || frame.data[5] || frame.data[6] || frame.data[7];
                break;
            case can_ids.internal_states:
                data.motor_on = frame.data[0] == 6;
                break;
            case can_ids.bike_status:
                switch (frame.data[0]) {
                case 1 << 0:
                    data.bike_status = 1;
                    break;
                case 1 << 1:
                    data.bike_status = 2;
                    break;
                case 1 << 2:
                    data.bike_status = 3;
                    break;
                case 1 << 3:
                    data.bike_status = 4;
                    break;
                default:
                    data.bike_status = 0;
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
            // printf("0x%03X [%d] ", frame.can_id, frame.can_dlc);

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
