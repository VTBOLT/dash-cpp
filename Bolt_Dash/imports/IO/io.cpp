#include "io.h"
#include <pigpio.h>

// Create IO class which can be included in QML
IO::IO(QObject *parent) : QObject(parent), m_buttonStatus{} {
    std::thread update_vars(&IO::updateVars, this);
    update_vars.detach();
}

// Calls the set functions with the values from data
void IO::updateVars() {
    if (gpio_Initizalise() == PI_INIT_FAILED) {
        std::cout << "ERROR: Failed to init pigpio" << std::endl;
        return;
    }
    gpioSetMode(MENU_BUTTON, PI_INPUT);
    gpioSetPullUpDown(MENU_BUTTON, PI_PUD_UP);

    while (true) {
        // Debug Message
        setButtonStatus(gpioRead(MENU_BUTTON));
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
