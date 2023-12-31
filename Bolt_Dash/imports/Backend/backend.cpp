#include "backend.h"
#include "can.h"

Backend::Backend(QObject* parent) :
    QObject(parent), m_motorTemp{}
{
    std::thread update_vars(&Backend::updateVars, this);
    update_vars.detach();
}

void Backend::updateVars() {
    while (true) {
        //    setMotorTemp(data.motor_temperature/70);
        setMotorTemp(motorTemp()+0.01);
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
}

double Backend::motorTemp() const {
    return m_motorTemp;
}

void Backend::setMotorTemp(const double temp) {
    if (m_motorTemp != temp) {
        std::cout << "temp changed to " << temp << std::endl;
        m_motorTemp = temp;
        emit motorTempChanged();
    }
}

std::thread can_thread(can::run);
