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
public:
    explicit Backend(QObject* parent = nullptr);
    double motorTemp() const;
    void setMotorTemp(const double temp);

signals:
    void motorTempChanged();

private:
    void updateVars();
    double m_motorTemp;
};

#endif // BACKEND_H
