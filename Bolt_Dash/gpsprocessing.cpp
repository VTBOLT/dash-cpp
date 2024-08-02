#include <iostream>
#include <cstring>
#include <unistd.h>
#include <fcntl.h>
#include <termios.h>

#include "nmea_decoder.cpp"

const char* SERIAL_PORT = "/dev/ttyAMA0";  // Serial port for GPS
const int BAUD_RATE = B9600;  // Baud rate for GPS communication

int initializeGPS() {
    int fd = open(SERIAL_PORT, O_RDWR | O_NOCTTY | O_NDELAY);
    if (fd == -1) {
        perror("Unable to open serial port");
        return -1;
    }

    struct termios options;
    tcgetattr(fd, &options);
    cfsetispeed(&options, BAUD_RATE);
    cfsetospeed(&options, BAUD_RATE);
    options.c_cflag |= (CLOCAL | CREAD);
    options.c_cflag &= ~PARENB;
    options.c_cflag &= ~CSTOPB;
    options.c_cflag &= ~CSIZE;
    options.c_cflag |= CS8;
    tcsetattr(fd, TCSANOW, &options);

    return fd;
}

int parserStuff() {
    // Function to initialize GPS serial port
    int gps_fd = initializeGPS();
    if (gps_fd < 0) {
        std::cerr << "Failed to initialize GPS serial port" << std::endl;
        return 1;
    }

    std::cout << "PiCAN+ GPS initialized successfully" << std::endl;

    // Main loop
    while (true) {
        // Read GPS data
        char gps_buffer[256];
        int n = read(gps_fd, gps_buffer, sizeof(gps_buffer));
        if (n > 0) {
            gps_buffer[n] = 0;  // Null-terminate the string
            std::cout << "GPS Data: " << gps_buffer;
            GPSData currentData = decodeNMEA(gps_buffer);
            printGPSData(currentData);
        }

        usleep(100000);  // Sleep for 100ms
    }

    close(gps_fd);
    return 0;
}
