#include "backend.h"
#include "can.h"
#include "constants.h"
#include "gpsprocessing.h"
#include "web.h"
#include <chrono>
#include <cstring>
#include <fcntl.h>
#include <fstream>
#include <functional>
#include <iostream>
#include <thread>
#include <unistd.h>

// Create Backend class which can be included in QML
Backend::Backend(QObject *parent) : QObject(parent), m_motorTemp{}, m_auxVoltage{}, m_auxPercent{},
                                    m_packSOC{}, m_highCellTemp{}, m_lowCellTemp{}, m_bmsTemp{}, m_motorSpeed{}, m_bikeSpeed{}, m_mcTemp{},
                                    m_bmsFault{}, m_packVoltage{}, m_motorOn{}, m_mcFault{}, m_bikeStatus{}, m_packCurrent{}, m_bmsErrorCodes{},
                                    m_bmsErrorCodesString{}, m_bmsError{}, m_bmsWarning{}, m_lat{}, m_lon{}, gps_lat{}, gps_lon{} {
    std::thread update_vars(&Backend::updateVars, this);
    update_vars.detach();

    std::thread run_app(&web::runApp);
    run_app.detach();

    std::thread run_gps(&gpsMain);
    run_gps.detach();
}

// Calls the set functions with the values from data
void Backend::updateVars() {
    while (true) {
        m.lock();
        // The only scaling here is to put the value into the right unit
        // all scaling defined in constants.h
        setMotorTemp(data.motor_temperature * MOTOR_TEMPERATURE_SCALE);     // celsius
        setAuxVoltage(data.aux_voltage * AUX_VOLTAGE_SCALE);                // volts
        setAuxPercent(data.aux_percent * AUX_PERCENT_SCALE);                // percent
        setPackSOC(data.pack_state_of_charge * PACK_STATE_OF_CHARGE_SCALE); // percent
        setPackVoltage(data.pack_voltage * PACK_VOLTAGE_SCALE);             // Voltage
        setPackCurrent(data.pack_current * PACK_CURRENT_SCALE);             // amps
        setHighCellTemp(data.high_cell_temp * HIGH_CELL_TEMP_SCALE);        // celsius
        setLowCellTemp(data.low_cell_temp * LOW_CELL_TEMP_SCALE);           // celsius
        setBmsTemp(data.bms_temperature * BMS_TEMPERATURE_SCALE);           // celsius
        setMotorSpeed(data.motor_speed * MOTOR_SPEED_SCALE);                // rpm
        setBikeSpeed(data.motor_speed * BIKE_SPEED_SCALE);                  // mph
        setMcTemp(data.mc_temperature * MC_TEMPERATURE_SCALE);              // celsius
        setBmsFault(data.bms_fault);
        setMotorOn(data.motor_on);
        setMcFault(data.mc_fault);
        setBikeStatus(data.bike_status);
        setBmsErrorCodes(data.bms_error_codes);
        setBmsError(data.bms_error);
        setBmsWarning(data.bms_warning);
        std::vector<QString> warnings = getErrorCodeStrings(data.bms_error_codes);
        setBmsErrorCodesString(warnings);
        m.unlock();

        gps_m.lock();
        setLat(gps_lat);
        setLon(gps_lon);
        std::cout << "Lat: " << lat() << " Lon: " << long() << std::endl;
        gps_m.unlock();
        // Debug Message
        // std::cout << "MotorTemp: " << motorTemp() << " AuxVoltage: " << auxVoltage() << " AuxPercent: " << auxPercent() << " PackSOC: " << packSOC() << " HighCellTemp: " << highCellTemp() << " LowCellTemp: " << lowCellTemp() << " BmsTemp: " << bmsTemp() << " MotorSpeed: " << motorSpeed() << " BikeSpeed: " << bikeSpeed() << std::endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
    }
}

std::vector<QString> Backend::getErrorCodeStrings(uint32_t errorCodes) {
    std::vector<QString> warnings;
    // Warnings
    if (errorCodes & bms_warnings.discharge_limit_enforcement) {
        warnings.push_back("Discharge Limit Enforcement");
    }
    if (errorCodes & bms_warnings.cell_balancing_stuck_off) {
        warnings.push_back("Cell Balancing Stuck Off");
    }
    if (errorCodes & bms_warnings.weak_cell) {
        warnings.push_back("Weak Cell");
    }
    if (errorCodes & bms_warnings.current_sensor) {
        warnings.push_back("Current Sensor");
    }
    if (errorCodes & bms_warnings.weak_pack) {
        warnings.push_back("Weak Pack");
    }
    if (errorCodes & bms_warnings.fan_monitor) {
        warnings.push_back("Fan Monitor");
    }
    // Errors
    if (errorCodes & bms_warnings.charger_safety_relay) {
        warnings.push_back("Charger Safety Relay");
    }
    if (errorCodes & bms_errors.internal_hardware) {
        warnings.push_back("Internal Hardware");
    }
    if (errorCodes & bms_warnings.internal_heatsink_thermistor) {
        warnings.push_back("Internal Heatsink Thermistor");
    }
    if (errorCodes & bms_errors.internal_software) {
        warnings.push_back("Internal Software");
    }
    if (errorCodes & bms_errors.highest_cell_voltage_too_high) {
        warnings.push_back("Highest Cell Voltage Too Low");
    }
    if (errorCodes & bms_errors.lowest_cell_voltage_too_low) {
        warnings.push_back("Lowest Cell Voltage Too Low");
    }
    if (errorCodes & bms_errors.pack_too_hot) {
        warnings.push_back("Pack Too Hot");
    }
    if (errorCodes & bms_errors.internal_communication) {
        warnings.push_back("Internal Communication");
    }
    if (errorCodes & bms_errors.low_cell_voltage) {
        warnings.push_back("Low Cell Voltage");
    }
    if (errorCodes & bms_warnings.open_wiring) {
        warnings.push_back("Open Wiring");
    }
    if (errorCodes & bms_errors.highest_cell_voltage_over_5v) {
        warnings.push_back("Highest Cell Voltage Over 5v");
    }
    if (errorCodes & bms_errors.cell_asic_fault) {
        warnings.push_back("Cell ASIC Fault");
    }
    if (errorCodes & bms_warnings.thermistor_fault) {
        warnings.push_back("Thermistor Fault");
    }
    if (errorCodes & bms_warnings.external_communication) {
        warnings.push_back("External Communication");
    }
    if (errorCodes & bms_errors.redundant_power_supply) {
        warnings.push_back("Redundant Power Supply");
    }
    if (errorCodes & bms_errors.high_voltage_isolation) {
        warnings.push_back("High Voltage Isolation");
    }
    if (errorCodes & bms_errors.input_power_supply) {
        warnings.push_back("Input Power Supply");
    }
    if (errorCodes & bms_warnings.charge_limit_enforcement) {
        warnings.push_back("Charge Limit Enforcement");
    }
    return warnings;
}

// Functions to get variable values
// { // Brackets for collapsability
double Backend::motorTemp() const {
    return m_motorTemp;
}

double Backend::auxVoltage() const {
    return m_auxVoltage;
}

double Backend::auxPercent() const {
    return m_auxPercent;
}

double Backend::packSOC() const {
    return m_packSOC;
}

double Backend::packVoltage() const {
    return m_packVoltage;
}

double Backend::highCellTemp() const {
    return m_highCellTemp;
}

double Backend::lowCellTemp() const {
    return m_lowCellTemp;
}

double Backend::bmsTemp() const {
    return m_bmsTemp;
}

double Backend::motorSpeed() const {
    return m_motorSpeed;
}

double Backend::bikeSpeed() const {
    return m_bikeSpeed;
}

double Backend::mcTemp() const {
    return m_mcTemp;
}

bool Backend::bmsFault() const {
    return m_bmsFault;
}

bool Backend::mcFault() const {
    return m_mcFault;
}

bool Backend::motorOn() const {
    return m_motorOn;
}

int Backend::bikeStatus() const {
    return m_bikeStatus;
}

double Backend::packCurrent() const {
    return m_packCurrent;
}

bool Backend::bmsError() const {
    return m_bmsError;
}

bool Backend::bmsWarning() const {
    return m_bmsWarning;
}

uint32_t Backend::bmsErrorCodes() const {
    return m_bmsErrorCodes;
}

std::vector<QString> Backend::bmsErrorCodesString() const {
    return m_bmsErrorCodesString;
}

double Backend::lat() const {
    return m_lat;
}

double Backend::lon() const {
    return m_lon;
}
// }

// Setter Functions
// { // Brackets for collapsability
void Backend::setMotorTemp(const double temp) {
    if (m_motorTemp != temp) {
        m_motorTemp = temp;
        emit motorTempChanged();
    }
}

void Backend::setAuxVoltage(const double cap) {
    if (m_auxVoltage != cap) {
        m_auxVoltage = cap;
        emit auxVoltageChanged();
    }
}

void Backend::setAuxPercent(const double cap) {
    if (m_auxPercent != cap) {
        m_auxPercent = cap;
        emit auxPercentChanged();
    }
}

void Backend::setPackSOC(const double soc) {
    if (m_packSOC != soc) {
        m_packSOC = soc;
        emit packSOCChanged();
    }
}

void Backend::setPackVoltage(const double voltage) {
    if (m_packVoltage != voltage) {
        m_packVoltage = voltage;
        emit packVoltageChanged();
    }
}

void Backend::setHighCellTemp(const double temp) {
    if (m_highCellTemp != temp) {
        m_highCellTemp = temp;
        emit highCellTempChanged();
    }
}

void Backend::setLowCellTemp(const double temp) {
    if (m_lowCellTemp != temp) {
        m_lowCellTemp = temp;
        emit lowCellTempChanged();
    }
}

void Backend::setBmsTemp(const double temp) {
    if (m_bmsTemp != temp) {
        m_bmsTemp = temp;
        emit bmsTempChanged();
    }
}

void Backend::setMotorSpeed(const double speed) {
    if (m_motorSpeed != speed) {
        m_motorSpeed = speed;
        emit motorSpeedChanged();
    }
}

void Backend::setBikeSpeed(const double speed) {
    if (m_bikeSpeed != speed) {
        m_bikeSpeed = speed;
        emit bikeSpeedChanged();
    }
}

void Backend::setMcTemp(const double temp) {
    if (m_mcTemp != temp) {
        m_mcTemp = temp;
        emit mcTempChanged();
    }
}

void Backend::setBmsFault(const bool fault) {
    if (m_bmsFault != fault) {
        m_bmsFault = fault;
        emit bmsFaultChanged();
    }
}

void Backend::setMcFault(const bool fault) {
    if (m_mcFault != fault) {
        m_mcFault = fault;
        emit mcFaultChanged();
    }
}

void Backend::setMotorOn(const bool on) {
    if (m_motorOn != on) {
        m_motorOn = on;
        emit motorOnChanged();
    }
}

void Backend::setBikeStatus(const int status) {
    if (m_bikeStatus != status) {
        m_bikeStatus = status;
        emit bikeStatusChanged();
    }
}

void Backend::setPackCurrent(const double current) {
    if (m_packCurrent != current) {
        m_packCurrent = current;
        emit packCurrentChanged();
    }
}

void Backend::setBmsError(const bool error) {
    if (m_bmsError != error) {
        m_bmsError = error;
        emit bmsErrorChanged();
    }
}

void Backend::setBmsWarning(const bool warning) {
    if (m_bmsWarning != warning) {
        m_bmsWarning = warning;
        emit bmsWarningChanged();
    }
}

void Backend::setBmsErrorCodes(const uint32_t warnings) {
    if (m_bmsErrorCodes != warnings) {
        m_bmsErrorCodes = warnings;
        emit bmsErrorCodesChanged();
    }
}

void Backend::setBmsErrorCodesString(const std::vector<QString> warnings) {
    if (m_bmsErrorCodesString != warnings) {
        m_bmsErrorCodesString = warnings;
        emit bmsErrorCodesStringChanged();
    }
}

void Backend::setLat(const double lat) {
    if (m_lat != lat) {
        m_lat = lat;
        emit latChanged();
    }
}

void Backend::setLon(const double lon) {
    if (m_lon != lon) {
        m_lon = lon;
        emit lonChanged();
    }
}
// }

std::thread can_thread(can::run);
