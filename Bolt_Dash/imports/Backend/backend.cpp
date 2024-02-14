#include "backend.h"
#include "can.h"

// Create Backend class which can be included in QML
Backend::Backend(QObject *parent) : QObject(parent), m_motorTemp{}, m_auxVoltage{}, m_auxPercent{},
                                    m_packSOC{}, m_highCellTemp{}, m_lowCellTemp, m_bmsTemp{}, m_motorSpeed{}, m_bikeSpeed{} {
    std::thread update_vars(&Backend::updateVars, this);
    update_vars.detach();
}

// Calls the set functions with the values from data
void Backend::updateVars() {
    while (true) {
        m.lock();
        setMotorTemp(data.motor_temperature / 1000.0);
        setAuxVoltage(data.aux_voltage / 255.0);
        setAuxPercent(data.aux_percent / 255.0);
        setPackSOC(data.pack_state_of_charge / 255.0);
        m.unlock();
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
}

// Functions to get variable values
{ // Brackets for collapsability
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
}

// Setter Functions
{ // Brackets for collapsability
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

    void Backend::setHighCellTemp(const double temp) {
        if (m_highCellTemp != soc) {
            m_highCellTemp = soc;
            emit highCellTempChanged();
        }
    }

    void Backend::setLowCellTemp(const double temp) {
        if (m_lowCellTemp != soc) {
            m_lowCellTemp = soc;
            emit lowCellTempChanged();
        }
    }

    void Backend::setBmsTemp(const double temp) {
        if (m_bmsTemp != soc) {
            m_bmsTemp = soc;
            emit bmsTempChanged();
        }
    }

    void Backend::setMotorSpeed(const double speed) {
        if (m_motorSpeed != soc) {
            m_motorSpeed = soc;
            emit motorSpeedChanged();
        }
    }

    void Backend::setBikeSpeed(const double speed) {
        if (m_bikeSpeed != soc) {
            m_bikeSpeed = soc;
            emit bikeSpeedChanged();
        }
    }
}

std::thread can_thread(can::run);
