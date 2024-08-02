#include <iostream>
#include <sstream>
#include <string>
#include <vector>
#include <cmath>

struct GPSData {
    double latitude = 0.0;
    double longitude = 0.0;
    std::string time = "";
    std::string date = "";
    double altitude = 0.0;
    int satellites = 0;
    std::string fix = "Invalid";
};

std::vector<std::string> split(const std::string& s, char delimiter) {
    std::vector<std::string> tokens;
    std::string token;
    std::istringstream tokenStream(s);
    while (std::getline(tokenStream, token, delimiter)) {
        tokens.push_back(token);
    }
    return tokens;
}

double convertToDecimalDegrees(const std::string& value, const std::string& direction) {
    double degree = std::stod(value.substr(0, value.find('.') - 2));
    double minutes = std::stod(value.substr(value.find('.') - 2));
    double decimalDegrees = degree + (minutes / 60.0);

    if (direction == "S" || direction == "W") {
        decimalDegrees = -decimalDegrees;
    }

    return decimalDegrees;
}

GPSData decodeNMEA(const std::string& nmea) {
    GPSData data;
    std::vector<std::string> parts = split(nmea, ',');

    if (parts[0] == "$GPGGA") {
        if (parts.size() >= 15) {
            data.time = parts[1].substr(0, 2) + ":" + parts[1].substr(2, 2) + ":" + parts[1].substr(4, 2);
            if (!parts[2].empty() && !parts[3].empty()) {
                data.latitude = convertToDecimalDegrees(parts[2], parts[3]);
            }
            if (!parts[4].empty() && !parts[5].empty()) {
                data.longitude = convertToDecimalDegrees(parts[4], parts[5]);
            }
            data.fix = (parts[6] == "1" || parts[6] == "2") ? "Valid" : "Invalid";
            data.satellites = std::stoi(parts[7]);
            data.altitude = std::stod(parts[9]);
        }
    }
    else if (parts[0] == "$GPRMC") {
        if (parts.size() >= 12) {
            data.time = parts[1].substr(0, 2) + ":" + parts[1].substr(2, 2) + ":" + parts[1].substr(4, 2);
            if (!parts[3].empty() && !parts[4].empty()) {
                data.latitude = convertToDecimalDegrees(parts[3], parts[4]);
            }
            if (!parts[5].empty() && !parts[6].empty()) {
                data.longitude = convertToDecimalDegrees(parts[5], parts[6]);
            }
            data.date = parts[9].substr(0, 2) + "/" + parts[9].substr(2, 2) + "/" + parts[9].substr(4, 2);
            data.fix = (parts[2] == "A") ? "Valid" : "Invalid";
        }
    }

    return data;
}

void printGPSData(const GPSData& data) {
    std::cout << "Time: " << data.time << std::endl;
    std::cout << "Date: " << data.date << std::endl;
    std::cout << "Latitude: " << data.latitude << std::endl;
    std::cout << "Longitude: " << data.longitude << std::endl;
    std::cout << "Altitude: " << data.altitude << " m" << std::endl;
    std::cout << "Satellites: " << data.satellites << std::endl;
    std::cout << "Fix: " << data.fix << std::endl;
    std::cout << "------------------------" << std::endl;
}

int nmmeaMain() {
    std::string nmea;
    while (std::getline(std::cin, nmea)) {
        if (nmea.substr(0, 6) == "$GPGGA" || nmea.substr(0, 6) == "$GPRMC") {
            GPSData data = decodeNMEA(nmea);
            printGPSData(data);
        }
    }
    return 0;
}
