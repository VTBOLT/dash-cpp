#include <cmath>
#include <iostream>
#include <sstream>
#include <string>
#include <vector>

struct GPSData {
    double latitude = 0.0;
    double longitude = 0.0;
    std::string time = "";
    std::string date = "";
    double altitude = 0.0;
    int satellites = 0;
    std::string fix = "Invalid";
};

std::vector<std::string> split(const std::string &s, char delimiter);

double convertToDecimalDegrees(const std::string &value, const std::string &direction);

GPSData decodeNMEA(const std::string &nmea);

void printGPSData(const GPSData &data);

int nmmeaMain();