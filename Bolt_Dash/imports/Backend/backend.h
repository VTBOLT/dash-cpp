#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <qqml.h>
#include <thread>
#include <chrono>
#include <iostream>

class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(double motorTemp READ motorTemp WRITE setMotorTemp NOTIFY motorTempChanged);
    Q_PROPERTY(double auxVoltage READ auxVoltage WRITE setAuxVoltage NOTIFY auxVoltageChanged);
    Q_PROPERTY(double auxPercent READ auxPercent WRITE setAuxPercent NOTIFY auxPercentChanged);
    Q_PROPERTY(double packSOC READ packSOC WRITE setPackSOC NOTIFY packSOCChanged);
public:
    explicit Backend(QObject* parent = nullptr);
    double motorTemp() const;
    double auxVoltage() const;
    double auxPercent() const;
    double packSOC() const;
    
    void setMotorTemp(const double temp);
    void setAuxVoltage(const double temp);
    void setAuxPercent(const double temp);
    void setPackSOC(const double temp);

signals:
    void motorTempChanged();
    void auxVoltageChanged();
    void auxPercentChanged();
    void apackSOCChanged();

private:
    void updateVars();
    double m_motorTemp;
    double m_auxVoltage;
    double m_auxPercent;
    double m_packSOC;
};

#endif // BACKEND_H
