#include "backend.h"
#include "can.h"

// Create Backend class which can be included in QML
Backend::Backend(QObject* parent) :
    QObject(parent), m_motorTemp{}, m_auxBattery{}, m_auxPercent{}, 
    packSOC{}
{
    std::thread update_vars(&Backend::updateVars, this);
    update_vars.detach();
}




// Calls the set functions with the values from data
void Backend::updateVars() {
    while (true) {
        m.lock();
        setMotorTemp(data.motor_temperature/1000.0);
        setAuxVoltage(data.aux_voltage/255.0);
        setAuxPercent(data.aux_percent/255.0);
        setPackSOC(data.pack_state_of_charge/255.0);
        m.unlock();
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
}




// Functions to get variable values
double Backend::motorTemp() const {
    return m_motorTemp;
}

double Backend::auxVoltage() const {
    return m_auxVoltage;
}

double Backend::auxPercent() const {
    return m_auxPercent;
}







void Backend::setMotorTemp(const double temp) {
    if (m_motorTemp != temp) {
        // std::cout << "temp changed to " << temp << std::endl;
        m_motorTemp = temp;
        emit motorTempChanged();
    }
}

void Backend::setAuxVoltage(const double cap) {
    // std::cout << "batt changed to " << cap << std::endl;
    if (m_auxVoltage != cap) {
        m_auxVoltage = cap;
        emit auxVoltageChanged();
    }
}

void Backend::setAuxPercent(const double cap) {
    // std::cout << "batt changed to " << cap << std::endl;
    if (m_auxVoltage != cap) {
        m_auxVoltage = cap;
        emit auxVoltageChanged();
    }
}



std::thread can_thread(can::run);
