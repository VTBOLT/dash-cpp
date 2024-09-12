#ifndef BACKEND_H
#define BACKEND_H

#include "qtmetamacros.h"
#include <QObject>
#include <QString>
#include <qqml.h>
#include <vector>

/**
 * @brief A class to represent the C++ backend of the dash which can
 * be included in QML to give the frontend access.
 *
 */
class Backend : public QObject {
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(double motorTemp READ motorTemp WRITE setMotorTemp NOTIFY motorTempChanged);
    Q_PROPERTY(double auxVoltage READ auxVoltage WRITE setAuxVoltage NOTIFY auxVoltageChanged);
    Q_PROPERTY(double auxPercent READ auxPercent WRITE setAuxPercent NOTIFY auxPercentChanged);
    Q_PROPERTY(double packSOC READ packSOC WRITE setPackSOC NOTIFY packSOCChanged);
    Q_PROPERTY(double packVoltage READ packVoltage WRITE setPackVoltage NOTIFY packVoltageChanged);
    Q_PROPERTY(double highCellTemp READ highCellTemp WRITE setHighCellTemp NOTIFY highCellTempChanged);
    Q_PROPERTY(double lowCellTemp READ lowCellTemp WRITE setLowCellTemp NOTIFY lowCellTempChanged);
    Q_PROPERTY(double bmsTemp READ bmsTemp WRITE setBmsTemp NOTIFY bmsTempChanged);
    Q_PROPERTY(double motorSpeed READ motorSpeed WRITE setMotorSpeed NOTIFY motorSpeedChanged);
    Q_PROPERTY(double bikeSpeed READ bikeSpeed WRITE setBikeSpeed NOTIFY bikeSpeedChanged);
    Q_PROPERTY(double mcTemp READ mcTemp WRITE setMcTemp NOTIFY mcTempChanged);
    Q_PROPERTY(bool bmsFault READ bmsFault WRITE setBmsFault NOTIFY bmsFaultChanged);
    Q_PROPERTY(bool mcFault READ mcFault WRITE setMcFault NOTIFY mcFaultChanged);
    Q_PROPERTY(bool motorOn READ motorOn WRITE setMotorOn NOTIFY motorOnChanged);
    Q_PROPERTY(int bikeStatus READ bikeStatus WRITE setBikeStatus NOTIFY bikeStatusChanged);
    Q_PROPERTY(double packCurrent READ packCurrent WRITE setPackCurrent NOTIFY packCurrentChanged);
    Q_PROPERTY(uint32_t bmsErrorCodes READ bmsErrorCodes WRITE setBmsErrorCodes NOTIFY bmsErrorCodesChanged);
    Q_PROPERTY(bool bmsError READ bmsError WRITE setBmsError NOTIFY bmsErrorChanged);
    Q_PROPERTY(bool bmsWarning READ bmsWarning WRITE setBmsWarning NOTIFY bmsWarningChanged);
    Q_PROPERTY(std::vector<QString> bmsErrorCodesString READ bmsErrorCodesString NOTIFY bmsErrorCodesStringChanged);
    Q_PROPERTY(double lat READ lat WRITE setLat NOTIFY latChanged);
    Q_PROPERTY(double lon READ lon WRITE setLon NOTIFY lonChanged);

public:
    /**
     * @brief Create Backend class which can be included in QML
     *
     * @param parent the QObject parent above the Backend
     */
    explicit Backend(QObject *parent = nullptr);

    /**
     * @brief Get the motor temperature
     *
     * @return The temperature in degrees Celsius
     */
    double motorTemp() const;

    /**
     * @brief Get the voltage of the aux pack
     *
     * @return The voltage in volts
     */
    double auxVoltage() const;

    /**
     * @brief Get the percent charge of the aux pack
     *
     * @return The percentage as a percent (e.g. 87.3)
     */
    double auxPercent() const;

    /**
     * @brief Get the state of charge of the main battery
     *
     * @return The percentage as a percent (e.g. 87.3)
     */
    double packSOC() const;

    /**
     * @brief Get the voltage of the main battery
     *
     * @return The voltage in volts
     */
    double packVoltage() const;

    /**
     * @brief Get the highest cell temperature in the pack
     *
     * @return The temperature in degrees Celsius
     */
    double highCellTemp() const;

    /**
     * @brief Get the lowest cell temperature in the pack
     *
     * @return The temperature in degrees Celsius
     */
    double lowCellTemp() const;

    /**
     * @brief Get the temeprature of the BMS
     *
     * @return The temperature in degrees Celsius
     */
    double bmsTemp() const;

    /**
     * @brief Get the speed of the motor
     *
     * @return The motor speed in RPM
     */
    double motorSpeed() const;

    /**
     * @brief Get the speed of the bike
     *
     * @return The speed in mph
     */
    double bikeSpeed() const;

    /**
     * @brief Get the temperature of the motor controller
     *
     * @return The highest temperature of the three sensors in degrees Celsius
     */
    double mcTemp() const;

    /**
     * @brief Get whether or not there is a BMS fault
     *
     * @return true if there is a fault
     * @return false if all is good
     */
    bool bmsFault() const;

    /**
     * @brief Get whether or not there is a motor controller fault
     *
     * @return true if there is a fault
     * @return false if all is good
     */
    bool mcFault() const;

    /**
     * @brief Get whether or not the motor is currently active
     *
     * @return true if the motor can be moved with the throttle
     * @return false if it cannot be moved electrically
     */
    bool motorOn() const;

    /**
     * @brief Get the current status of the bike.
     *   1. Idle
     *   2. Precharge
     *   3. Ready
     *   4. Active
     *   5. There is a fault somewhere
     *
     * @return An integer representing the status as shown above
     */
    int bikeStatus() const;

    /**
     * @brief Get the current flowing from the main pack
     *
     * @return The current in amps
     */
    double packCurrent() const;

    /**
     * @brief Get whether or not there is a BMS error
     *
     * @return true if there is any major error
     * @return false if there is not
     */
    bool bmsError() const;

    /**
     * @brief Get whether or not there is a BMS warning
     *
     * @return true if there is a minor error/warning
     * @return false if there is not
     */
    bool bmsWarning() const;

    /**
     * @brief Get the BMS error codes as a bitfield
     *
     * @return A 32-bit integer with each bit representing a different error
     */
    uint32_t bmsErrorCodes() const;

    /**
     * @brief Get the BMS error codes as a vector of strings
     *
     * @return A Vector of Qt-Strings with each string representing a different error
     */
    std::vector<QString> bmsErrorCodesString() const;

    /**
     * @brief Get the latitude of the bike
     *
     * @return The latitude in degrees
     */
    double lat() const;

    /**
     * @brief Get the longitude of the bike
     *
     * @return The longitude in degrees
     */
    double lon() const;

    /**
     * @brief Set the Motor Temperature parameter, will get overwritten internally
     *
     * @param temp The temperature to set in degrees Celsius
     */
    void setMotorTemp(const double temp);

    /**
     * @brief Set the Aux Voltage parameter, will get overwritten internally
     *
     * @param cap The temperature to set in degrees Celsius
     */
    void setAuxVoltage(const double cap);

    /**
     * @brief Set the Aux Percent parameter, will get overwritten internally
     *
     * @param cap The percent to set
     */
    void setAuxPercent(const double cap);

    /**
     * @brief Set the Pack SOC parameter, will get overwritten internally
     *
     * @param soc The percent to set
     */
    void setPackSOC(const double soc);

    /**
     * @brief Set the Pack Voltage parameter, will get overwritten internally
     *
     * @param voltage The voltage to set in volts
     */
    void setPackVoltage(const double voltage);

    /**
     * @brief Set the High Cell Temp parameter, will get overwritten internally
     *
     * @param temp The temperature to set in degrees Celsius
     */
    void setHighCellTemp(const double temp);

    /**
     * @brief Set the Low Cell Temp parameter, will get overwritten internally
     *
     * @param temp The temperature to set in degrees Celsius
     */
    void setLowCellTemp(const double temp);

    /**
     * @brief Set the BMS Temp parameter, will get overwritten internally
     *
     * @param temp The temperature to set in degrees Celsius
     */
    void setBmsTemp(const double temp);

    /**
     * @brief Set the Motor Speed parameter, will get overwritten internally
     *
     * @param speed The speed to set in RPM
     */
    void setMotorSpeed(const double speed);

    /**
     * @brief Set the Bike Speed parameter, will get overwritten internally
     *
     * @param speed The speed to set in mph
     */
    void setBikeSpeed(const double speed);

    /**
     * @brief Set the MC Temp parameter, will get overwritten internally
     *
     * @param temp The temperature to set in degrees Celsius
     */
    void setMcTemp(const double temp);

    /**
     * @brief Set the BMS Fault parameter, will get overwritten internally
     *
     * @param fault Whether or not there is a fault
     */
    void setBmsFault(const bool fault);

    /**
     * @brief Set the MC Fault parameter, will get overwritten internally
     *
     * @param fault Whether or not there is a fault
     */
    void setMcFault(const bool fault);

    /**
     * @brief Set the Motor On parameter, will get overwritten internally
     *
     * @param on Whether or not the motor is on
     */
    void setMotorOn(const bool on);

    /**
     * @brief Set the Bike Status parameter, will get overwritten internally
     *
     * @param status The status of the bike
     */
    void setBikeStatus(const int status);

    /**
     * @brief Set the Pack Current parameter, will get overwritten internally
     *
     * @param current The current to set in amps
     */
    void setPackCurrent(const double current);

    /**
     * @brief Set the BMS Error parameter, will get overwritten internally
     *
     * @param error Whether or not there is an error
     */
    void setBmsError(const bool error);

    /**
     * @brief Set the BMS Warning parameter, will get overwritten internally
     *
     * @param warning Whether or not there is a warning
     */
    void setBmsWarning(const bool warning);

    /**
     * @brief Set the BMS Error Codes parameter, will get overwritten internally
     *
     * @param warnings The error codes to set
     */
    void setBmsErrorCodes(const uint32_t warnings);

    /**
     * @brief Set the BMS Error Codes String parameter, will get overwritten internally
     *
     * @param warnings The error codes to set
     */
    void setBmsErrorCodesString(const std::vector<QString> warnings);

    /**
     * @brief Set the Latitude parameter, will get overwritten internally
     *
     * @param lat The latitude to set in degrees
     */
    void setLat(const double lat);

    /**
     * @brief Set the Longitude parameter, will get overwritten internally
     *
     * @param lon The longitude to set in degrees
     */
    void setLon(const double lon);

signals:
    void motorTempChanged();
    void auxVoltageChanged();
    void auxPercentChanged();
    void packSOCChanged();
    void packVoltageChanged();
    void highCellTempChanged();
    void lowCellTempChanged();
    void bmsTempChanged();
    void motorSpeedChanged();
    void bikeSpeedChanged();
    void mcTempChanged();
    void bmsFaultChanged();
    void mcFaultChanged();
    void motorOnChanged();
    void bikeStatusChanged();
    void packCurrentChanged();
    void bmsErrorChanged();
    void bmsWarningChanged();
    void bmsErrorCodesChanged();
    void bmsErrorCodesStringChanged();
    void latChanged();
    void lonChanged();

private:
    void updateVars();
    std::vector<QString> getErrorCodeStrings(uint32_t errorCodes);
    double m_motorTemp;
    double m_auxVoltage;
    double m_auxPercent;
    double m_packSOC;
    double m_packVoltage;
    double m_highCellTemp;
    double m_lowCellTemp;
    double m_bmsTemp;
    double m_motorSpeed;
    double m_bikeSpeed;
    double m_mcTemp;
    bool m_bmsFault;
    bool m_mcFault;
    bool m_motorOn;
    int m_bikeStatus;
    double m_packCurrent;
    bool m_bmsError;
    bool m_bmsWarning;
    uint32_t m_bmsErrorCodes;
    std::vector<QString> m_bmsErrorCodesString;
    double m_lat;
    double m_lon;
};

#endif // BACKEND_H
