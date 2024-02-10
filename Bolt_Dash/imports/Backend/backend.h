#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <chrono>
#include <iostream>
#include <qqml.h>
#include <thread>

class Backend : public QObject {
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(double motorTemp READ motorTemp WRITE setMotorTemp NOTIFY motorTempChanged);
    Q_PROPERTY(double auxVoltage READ auxVoltage WRITE setAuxVoltage NOTIFY auxVoltageChanged);
    Q_PROPERTY(double auxPercent READ auxPercent WRITE setAuxPercent NOTIFY auxPercentChanged);
    Q_PROPERTY(double packSOC READ packSOC WRITE setPackSOC NOTIFY packSOCChanged);
    Q_PROPERTY(double highCellTemp READ highCellTemp WRITE setHighCellTemp NOTIFY highCellTempChanged);
    Q_PROPERTY(double lowCellTemp READ lowCellTemp WRITE setLowCellTemp NOTIFY lowCellTempChanged);

public:
    explicit Backend(QObject *parent = nullptr);
    double motorTemp() const;
    double auxVoltage() const;
    double auxPercent() const;
    double packSOC() const;
    double highCellTemp() const;
    double lowCellTemp() const;

    void setMotorTemp(const double temp);
    void setAuxVoltage(const double cap);
    void setAuxPercent(const double cap);
    void setPackSOC(const double soc);
    void setHighCellTemp(const double temp);
    void setLowCellTemp(const double temp);

signals:
    void motorTempChanged();
    void auxVoltageChanged();
    void auxPercentChanged();
    void packSOCChanged();
    void highCellTempChanged();
    void lowCellTempChanged();

private:
    void updateVars();
    double m_motorTemp;
    double m_auxVoltage;
    double m_auxPercent;
    double m_packSOC;
    double m_highCellTemp;
    double m_lowCellTemp;
};

#endif // BACKEND_H
