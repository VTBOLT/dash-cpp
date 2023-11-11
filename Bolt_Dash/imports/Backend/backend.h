#ifndef BACKEND_H
#define BACKEND_H

#include <QObject>
#include <QString>
#include <qqml.h>
#include <thread>
#include <iostream>

class Backend : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Backend(QObject* parent = nullptr);
};

#endif // BACKEND_H
