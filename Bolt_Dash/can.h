#ifndef CAN_H
#define CAN_H

#include <mutex>
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
    uint16_t pack_voltage{};
    int16_t pack_current{};
    uint16_t high_cell_temp{};
    uint16_t low_cell_temp{};
    int16_t motor_temperature{};
    uint16_t bms_temperature{};
    uint16_t mc_temperature{};
    int16_t motor_speed{};
    int16_t bike_speed{};
    uint8_t bms_error{};
    uint8_t mc_fault{};
    uint8_t motor_on{};
    uint8_t bike_status{};
};

// ID's for each CAN thing
constexpr struct {
    canid_t aux_battery{0x700};
    canid_t info{0x6B0};
    canid_t main_pack_temp{0x6B4};
    canid_t motor_temp{0xA2};
    canid_t bms_temp{0x6B1};
    canid_t mc_temp{0xA0};
    canid_t rpm{0xA5};
    canid_t speed{0x00};
    canid_t mc_faults{0x0AB};
    canid_t internal_states{0x0AA};
} can_ids;

extern std::mutex m;
extern our_candata data;

namespace can {
    int run();
}

#endif // CAN_H
