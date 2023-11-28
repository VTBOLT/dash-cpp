#ifndef CAN_H
#define CAN_H

#include <chrono>
#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <thread>
#include <unistd.h>

#include <net/if.h>
#include <sys/ioctl.h>
#include <sys/socket.h>

#include <linux/can.h>
#include <linux/can/raw.h>

struct {
    int8_t aux_voltage{};
    int8_t aux_percent{};
    int8_t pack_state_of_charge{};
    int16_t high_cell_temp{};
    int16_t low_cell_temp{};
    int16_t motor_temperature{};
    int16_t bms_temperature{};
    int16_t motor_speed{};
    int16_t bike_speed{};
} data;

// ID's for each CAN thing
constexpr struct {
    canid_t aux_battery{0xB1};
    canid_t main_battery{0xB2};
    canid_t main_pack_temp{0xF1};
    canid_t motor_temp{0xF2};
    canid_t bms_temp{0xF3};
    canid_t rpm{0xA1};
    canid_t speed{0xA2};
} can_ids;

namespace can {
    int run();
}

#endif // CAN_H
