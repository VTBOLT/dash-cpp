#include "gpsprocessing.h"

std::mutex gps_m;
double gps_lat;
double gps_lon;

#ifdef GPS_LIB_FOUND

int gpsMain() {
    gpsmm gps_rec("localhost", DEFAULT_GPSD_PORT);

    if (!gps_rec.stream(WATCH_ENABLE | WATCH_JSON)) {
        std::cerr << "No GPSD running." << std::endl;
        return 1;
    }

    while (true) {
        struct gps_data_t *gpsd_data;

        if (!gps_rec.waiting(5000000)) {
            continue;
        }

        gpsd_data = gps_rec.read();

        if (gpsd_data == nullptr) {
            std::cerr << "Read error." << std::endl;
            continue;
        }

        if ((gpsd_data->fix.mode == MODE_2D || gpsd_data->fix.mode == MODE_3D) &&
            !std::isnan(gpsd_data->fix.latitude) &&
            !std::isnan(gpsd_data->fix.longitude)) {

            // std::cout << std::fixed << std::setprecision(6);
            // std::cout << "Latitude: " << gpsd_data->fix.latitude << std::endl;
            // std::cout << "Longitude: " << gpsd_data->fix.longitude << std::endl;
            // std::cout << "Altitude: " << gpsd_data->fix.altitude << " m" << std::endl;
            // std::cout << "Speed: " << gpsd_data->fix.speed * 3.6 << " km/h" << std::endl;

            // // Use timespec_t for time
            // std::cout << "Timestamp: "
            //           << gpsd_data->fix.time.tv_sec << "."
            //           << std::setfill('0') << std::setw(9)
            //           << gpsd_data->fix.time.tv_nsec << std::endl;

            // std::cout << std::endl;

            gps_m.lock();
            gps_lat = gpsd_data->fix.latitude;
            gps_lon = gpsd_data->fix.longitude;
            gps_m.unlock();
        }

        sleep(1);
    }

    return 0;
}

#else
int gpsMain() {
    gps_lat = 0.0;
    gps_lon = 0.0;
    return 0;
}
#endif