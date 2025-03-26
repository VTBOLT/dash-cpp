#pragma once

#include <cmath>
#include <iomanip>
#include <iostream>
#if __has_include(<libgpsmm.h>)
#include <libgpsmm.h>
#define GPS_LIB_FOUND 1
#endif
#include <mutex>
#include <unistd.h>

extern std::mutex gps_m;
extern double gps_lat;
extern double gps_lon;

int gpsMain();