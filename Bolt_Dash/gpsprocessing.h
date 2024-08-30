#pragma once

#include <cmath>
#include <iomanip>
#include <iostream>
#include <libgpsmm.h>
#include <mutex>
#include <unistd.h>

extern std::mutex gps_m;
extern double gps_lat;
extern double gps_lon;

int gpsMain();