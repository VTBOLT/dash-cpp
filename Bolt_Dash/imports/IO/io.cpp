#include "io.h"
#include <pigpio.h>

// Create IO class which can be included in QML
IO::IO(QObject *parent) : QObject(parent), m_buttonStatus{} {
    std::thread update_vars(&IO::updateVars, this);
    update_vars.detach();
}

// Calls the set functions with the values from data
void IO::updateVars() {
    while (true) {
        // Debug Message
        m_buttonStatus = gpioRead(MENU_BUTTON);
        std::cout << "Button: " << buttonStatus() << std::endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
}

// Functions to get variable values
bool IO::buttonStatus() const {
    return m_buttonStatus;
}

// Setter Functions
void IO::setButtonStatus(const bool status) {
    if (m_buttonStatus != status) {
        m_buttonStatus = status;
        emit buttonStatusChanged();
        if (m_buttonStatus == PRESSED) {
            emit buttonTapped();
        }
    }
}
