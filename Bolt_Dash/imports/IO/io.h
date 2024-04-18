#ifndef IO_H
#define IO_H
#define PRESSED 0
#define MENU_BUTTON 26

#include <QObject>
#include <QString>
#include <chrono>
#include <iostream>
#include <qqml.h>
#include <thread>

class IO : public QObject {
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(bool m_buttonStatus READ buttonStatus WRITE setButtonStatus NOTIFY buttonStatusChanged);

public:
    explicit IO(QObject *parent = nullptr);
    bool buttonStatus();
    void setButtonStatus(bool status);

signals:
    void buttonStatusChanged();
    void buttonTapped();

private:
    void updateVars();
    bool m_buttonStatus;
};

#endif // IO_H
