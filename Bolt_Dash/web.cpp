#include "web.h"
#include "can.h"
#include "constants.h"
#include "crow.h"
#include <string>

namespace web {

    void runApp() {
        crow::SimpleApp app;

        CROW_ROUTE(app, "/")
        ([]() {
            std::chrono::duration now = std::chrono::system_clock::now().time_since_epoch();
            crow::json::wvalue response({{"timestamp", std::chrono::duration_cast<std::chrono::milliseconds>(now).count()}});
            m.lock();
            response["pack_state_of_charge"] = data.pack_state_of_charge * PACK_STATE_OF_CHARGE_SCALE;
            response["pack_current"] = data.pack_current * PACK_CURRENT_SCALE;
            response["high_cell_temp"] = data.high_cell_temp * HIGH_CELL_TEMP_SCALE;
            response["low_cell_temp"] = data.low_cell_temp * LOW_CELL_TEMP_SCALE;
            response["motor_temperature"] = data.motor_temperature * MOTOR_TEMPERATURE_SCALE;
            response["bms_temperature"] = data.bms_temperature * BMS_TEMPERATURE_SCALE;
            response["mc_temperature"] = data.mc_temperature * MC_TEMPERATURE_SCALE;
            response["motor_speed"] = data.motor_speed * MOTOR_SPEED_SCALE;
            response["bike_speed"] = data.bike_speed * BIKE_SPEED_SCALE;
            response["bms_error"] = data.bms_error;
            response["mc_fault"] = data.mc_fault;
            response["motor_on"] = data.motor_on;
            response["bike_status"] = data.bike_status;
            m.unlock();
            return response;
        });

        app.port(18080).multithreaded().run_async();
    }
}
