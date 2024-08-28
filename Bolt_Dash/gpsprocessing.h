#ifndef GPSPROCESSING_H
#define GPSPROCESSING_H

#include <cstring>
#include <fcntl.h>
#include <iostream>
#include <termios.h>
#include <unistd.h>

#include "nmea_decoder.h"

int initializeGPS();

int parserStuff();

#endif