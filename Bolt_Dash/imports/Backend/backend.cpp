#include "backend.h"
#include "can.h"

Backend::Backend(QObject* parent) :
QObject(parent)
{
}

std::thread can_thread(can::run);
