#ifndef CAN_H
#define CAN_H

#include <mutex>
#include <unistd.h>

#include <net/if.h>
#include <sys/ioctl.h>
#include <sys/socket.h>

#if __has_include(<linux/can.h>) && __has_include(<linux/can/raw.h>)
#include <linux/can.h>
#include <linux/can/raw.h>
#define CAN_LIB_FOUND 1
#endif

#define BMS_FAULT_MASK 0b0010000

/**
 * @brief This is a struct that contains all the data that we get from the CAN bus
 * and is used in the dash project.
 *
 */
struct our_candata {
    /**
     * @brief The voltage of the aux pack
     */
    uint8_t aux_voltage{};
    /**
     * @brief The battery percentage of the aux pack
     */
    uint8_t aux_percent{};
    /**
     * @brief The state of charge of the main pack as a percentage
     */
    uint8_t pack_state_of_charge{};
    /**
     * @brief The voltage of the main pack
     */
    uint16_t pack_voltage{};
    /**
     * @brief The current of the main pack
     */
    int16_t pack_current{};
    /**
     * @brief The temperature of the hottest cell group in the main pack
     */
    uint16_t high_cell_temp{};
    /**
     * @brief The temperature of the coldest cell group in the main pack
     */
    uint16_t low_cell_temp{};
    /**
     * @brief The temperature of the motor
     */
    int16_t motor_temperature{};
    /**
     * @brief The temperature of the BMS
     */
    uint16_t bms_temperature{};
    /**
     * @brief The temperature of the motor controller
     */
    uint16_t mc_temperature{};
    /**
     * @brief The RPM of the motor
     */
    int16_t motor_speed{};
    /**
     * @brief The speed of the bike in mph
     */
    int16_t bike_speed{};
    /**
     * @brief The fault status of the BMS
     */
    uint8_t bms_fault{};
    /**
     * @brief Whether the BMS has any errors
     */
    uint8_t bms_error{};
    /**
     * @brief Whether the BMS has any warnings
     */
    uint8_t bms_warning{};
    /**
     * @brief The actual error codes of the BMS concatenated together
     */
    uint32_t bms_error_codes{};
    /**
     * @brief Whether or no the MC has a fault
     */
    uint8_t mc_fault{};
    /**
     * @brief Whether or not the motor is active
     */
    uint8_t motor_on{};
    /**
     * @brief The internal state of the bike, not used rn
     */
    uint8_t bike_status{};
    /**
     * @brief The highest cell voltage in the main pack
     */
    uint16_t highest_cell_voltage{};
    /**
     * @brief The lowest cell voltage in the main pack
     */
    uint16_t lowest_cell_voltage{};
};

// ID's for each CAN thing
#ifdef CAN_LIB_FOUND
constexpr struct {
    canid_t aux_battery{0x700};
    canid_t info{0x6B0};
    canid_t cell_max_min_voltages{0x6B3};
    canid_t main_pack_temp{0x6B4};
    canid_t bms_error_codes{0x6B6};
    canid_t motor_temp{0xA2};
    canid_t bms_temp{0x6B1};
    canid_t mc_temp{0xA0};
    canid_t rpm{0xA5};
    canid_t speed{0x00};
    canid_t mc_faults{0x0AB};
    canid_t internal_states{0x0AA};
} can_ids;
#else
constexpr struct {

} can_ids;
#endif // CAN_LIB_FOUND

constexpr struct {
    uint32_t discharge_limit_enforcement{1 << 0};
    uint32_t charger_safety_relay{1 << 1};
    uint32_t internal_heatsink_thermistor{1 << 3};
    uint32_t cell_balancing_stuck_off{1 << 9};
    uint32_t weak_cell{1 << 10};
    uint32_t open_wiring{1 << 12};
    uint32_t current_sensor{1 << 13};
    uint32_t weak_pack{1 << 16};
    uint32_t fan_monitor{1 << 17};
    uint32_t thermistor_fault{1 << 18};
    uint32_t external_communication{1 << 19};
    uint32_t charge_limit_enforcement{1 << 23};
} bms_warnings;

constexpr struct {
    uint32_t internal_hardware{1 << 2};
    uint32_t internal_software{1 << 4};
    uint32_t highest_cell_voltage_too_high{1 << 5};
    uint32_t lowest_cell_voltage_too_low{1 << 6};
    uint32_t pack_too_hot{1 << 7};
    uint32_t internal_communication{1 << 8};
    uint32_t low_cell_voltage{1 << 11};
    uint32_t highest_cell_voltage_over_5v{1 << 14};
    uint32_t cell_asic_fault{1 << 15};
    uint32_t redundant_power_supply{1 << 20};
    uint32_t high_voltage_isolation{1 << 21};
    uint32_t input_power_supply{1 << 22};
} bms_errors;

const uint32_t ALL_BMS_ERRORS = bms_errors.internal_hardware | bms_errors.internal_software |
                                bms_errors.highest_cell_voltage_too_high | bms_errors.lowest_cell_voltage_too_low |
                                bms_errors.pack_too_hot | bms_errors.internal_communication | bms_errors.low_cell_voltage |
                                bms_errors.highest_cell_voltage_over_5v | bms_errors.cell_asic_fault |
                                bms_errors.redundant_power_supply | bms_errors.high_voltage_isolation |
                                bms_errors.input_power_supply;
const uint32_t ALL_BMS_WARNINGS = bms_warnings.charger_safety_relay | bms_warnings.discharge_limit_enforcement |
                                  bms_warnings.cell_balancing_stuck_off | bms_warnings.internal_heatsink_thermistor | bms_warnings.weak_cell |
                                  bms_warnings.current_sensor | bms_warnings.weak_pack | bms_warnings.fan_monitor |
                                  bms_warnings.thermistor_fault | bms_warnings.external_communication |
                                  bms_warnings.open_wiring | bms_warnings.charge_limit_enforcement;
extern std::mutex m;
extern our_candata data;

namespace can {
    int run();
}

#endif // CAN_H
