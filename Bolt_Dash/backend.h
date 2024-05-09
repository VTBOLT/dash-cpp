#ifndef BACKEND_H
#define BACKEND_H

#include "qtmetamacros.h"
#include <QObject>
#include <QString>
#include <qqml.h>
#include <vector>

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

public:
    explicit Backend(QObject *parent = nullptr);
    double motorTemp() const;
    double auxVoltage() const;
    double auxPercent() const;
    double packSOC() const;
    double packVoltage() const;
    double highCellTemp() const;
    double lowCellTemp() const;
    double bmsTemp() const;
    double motorSpeed() const;
    double bikeSpeed() const;
    double mcTemp() const;
    bool bmsFault() const;
    bool mcFault() const;
    bool motorOn() const;
    int bikeStatus() const;
    double packCurrent() const;
    bool bmsError() const;
    bool bmsWarning() const;
    uint32_t bmsErrorCodes() const;
    std::vector<QString> bmsErrorCodesString() const;

    void setMotorTemp(const double temp);
    void setAuxVoltage(const double cap);
    void setAuxPercent(const double cap);
    void setPackSOC(const double soc);
    void setPackVoltage(const double voltage);
    void setHighCellTemp(const double temp);
    void setLowCellTemp(const double temp);
    void setBmsTemp(const double temp);
    void setMotorSpeed(const double speed);
    void setBikeSpeed(const double speed);
    void setMcTemp(const double temp);
    void setBmsFault(const bool fault);
    void setMcFault(const bool fault);
    void setMotorOn(const bool on);
    void setBikeStatus(const int status);
    void setPackCurrent(const double current);
    void setBmsError(const bool error);
    void setBmsWarning(const bool warning);
    void setBmsErrorCodes(const uint32_t warnings);
    void setBmsErrorCodesString(const std::vector<QString> warnings);

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
};

#endif // BACKEND_H
