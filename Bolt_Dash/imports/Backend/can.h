#ifndef CAN_H
#define CAN_H

#include <chrono>
#include <iostream>
#include <mutex>
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

#define BMS_FAULT_MASK 0b0010000

struct our_candata {
    uint8_t aux_voltage{};
    uint8_t aux_percent{};
    uint8_t pack_state_of_charge{};
    uint16_t high_cell_temp{};
    uint16_t low_cell_temp{};
    int16_t motor_temperature{};
    uint16_t bms_temperature{};
    int16_t motor_speed{};
    int16_t bike_speed{};
    uint8_t bms_error{};
};

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

extern std::mutex m;
extern our_candata data;

namespace can {
    int run();
}

#endif // CAN_H
