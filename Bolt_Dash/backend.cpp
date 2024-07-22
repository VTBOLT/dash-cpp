#include "backend.h"
#include "can.h"
#include "constants.h"
#include "web.h"
#include <chrono>
#include <fstream>
#include <iostream>
#include <thread>

#include <nmeaparse/GPSService.h>
#include <nmeaparse/NMEACommand.h>
#include <nmeaparse/NMEAParser.h>
#include <nmeaparse/NumberConversion.h>

using namespace nmea;

// Create Backend class which can be included in QML
Backend::Backend(QObject *parent) : QObject(parent), m_motorTemp{}, m_auxVoltage{}, m_auxPercent{},
                                    m_packSOC{}, m_highCellTemp{}, m_lowCellTemp{}, m_bmsTemp{}, m_motorSpeed{}, m_bikeSpeed{}, m_mcTemp{},
                                    m_bmsFault{}, m_packVoltage{}, m_motorOn{}, m_mcFault{}, m_bikeStatus{}, m_packCurrent{}, m_bmsErrorCodes{},
                                    m_bmsErrorCodesString{}, m_bmsError{}, m_bmsWarning{} {
    std::thread update_vars(&Backend::updateVars, this);
    update_vars.detach();

    std::thread run_app(&web::runApp);
    run_app.detach();
}

// Calls the set functions with the values from data
void Backend::updateVars() {
    while (true) {
        m.lock();
        // The only scaling here is to put the value into the right unit
        // all scaling defined in constants.h
        setMotorTemp(data.motor_temperature * MOTOR_TEMPERATURE_SCALE);     // celsius
        setAuxVoltage(data.aux_voltage * AUX_VOLTAGE_SCALE);                // volts
        setAuxPercent(data.aux_percent * AUX_PERCENT_SCALE);                // percent
        setPackSOC(data.pack_state_of_charge * PACK_STATE_OF_CHARGE_SCALE); // percent
        setPackVoltage(data.pack_voltage * PACK_VOLTAGE_SCALE);             // Voltage
        setPackCurrent(data.pack_current * PACK_CURRENT_SCALE);             // amps
        setHighCellTemp(data.high_cell_temp * HIGH_CELL_TEMP_SCALE);        // celsius
        setLowCellTemp(data.low_cell_temp * LOW_CELL_TEMP_SCALE);           // celsius
        setBmsTemp(data.bms_temperature * BMS_TEMPERATURE_SCALE);           // celsius
        setMotorSpeed(data.motor_speed * MOTOR_SPEED_SCALE);                // rpm
        setBikeSpeed(data.motor_speed * BIKE_SPEED_SCALE);                  // mph
        setMcTemp(data.mc_temperature * MC_TEMPERATURE_SCALE);              // celsius
        setBmsFault(data.bms_fault);
        setMotorOn(data.motor_on);
        setMcFault(data.mc_fault);
        setBikeStatus(data.bike_status);
        setBmsErrorCodes(data.bms_error_codes);
        setBmsError(data.bms_error);
        setBmsWarning(data.bms_warning);
        std::vector<QString> warnings = getErrorCodeStrings(data.bms_error_codes);
        setBmsErrorCodesString(warnings);
        m.unlock();
        // Debug Message
        // std::cout << "MotorTemp: " << motorTemp() << " AuxVoltage: " << auxVoltage() << " AuxPercent: " << auxPercent() << " PackSOC: " << packSOC() << " HighCellTemp: " << highCellTemp() << " LowCellTemp: " << lowCellTemp() << " BmsTemp: " << bmsTemp() << " MotorSpeed: " << motorSpeed() << " BikeSpeed: " << bikeSpeed() << std::endl;
        std::this_thread::sleep_for(std::chrono::milliseconds(1));
    }
}

std::vector<QString> Backend::getErrorCodeStrings(uint32_t errorCodes) {
    std::vector<QString> warnings;
    // Warnings
    if (errorCodes & bms_warnings.discharge_limit_enforcement) {
        warnings.push_back("Discharge Limit Enforcement");
    }
    if (errorCodes & bms_warnings.cell_balancing_stuck_off) {
        warnings.push_back("Cell Balancing Stuck Off");
    }
    if (errorCodes & bms_warnings.weak_cell) {
        warnings.push_back("Weak Cell");
    }
    if (errorCodes & bms_warnings.current_sensor) {
        warnings.push_back("Current Sensor");
    }
    if (errorCodes & bms_warnings.weak_pack) {
        warnings.push_back("Weak Pack");
    }
    if (errorCodes & bms_warnings.fan_monitor) {
        warnings.push_back("Fan Monitor");
    }
    // Errors
    if (errorCodes & bms_errors.charger_safety_relay) {
        warnings.push_back("Charger Safety Relay");
    }
    if (errorCodes & bms_errors.internal_hardware) {
        warnings.push_back("Internal Hardware");
    }
    if (errorCodes & bms_errors.internal_heatsink_thermistor) {
        warnings.push_back("Internal Heatsink Thermistor");
    }
    if (errorCodes & bms_errors.internal_software) {
        warnings.push_back("Internal Software");
    }
    if (errorCodes & bms_errors.highest_cell_voltage_too_high) {
        warnings.push_back("Highest Cell Voltage Too Low");
    }
    if (errorCodes & bms_errors.lowest_cell_voltage_too_low) {
        warnings.push_back("Lowest Cell Voltage Too Low");
    }
    if (errorCodes & bms_errors.pack_too_hot) {
        warnings.push_back("Pack Too Hot");
    }
    if (errorCodes & bms_errors.internal_communication) {
        warnings.push_back("Internal Communication");
    }
    if (errorCodes & bms_errors.low_cell_voltage) {
        warnings.push_back("Low Cell Voltage");
    }
    if (errorCodes & bms_errors.open_wiring) {
        warnings.push_back("Open Wiring");
    }
    if (errorCodes & bms_errors.highest_cell_voltage_over_5v) {
        warnings.push_back("Highest Cell Voltage Over 5v");
    }
    if (errorCodes & bms_errors.cell_asic_fault) {
        warnings.push_back("Cell ASIC Fault");
    }
    if (errorCodes & bms_errors.thermistor_fault) {
        warnings.push_back("Thermistor Fault");
    }
    if (errorCodes & bms_errors.external_communication) {
        warnings.push_back("External Communication");
    }
    if (errorCodes & bms_errors.redundant_power_supply) {
        warnings.push_back("Redundant Power Supply");
    }
    if (errorCodes & bms_errors.high_voltage_isolation) {
        warnings.push_back("High Voltage Isolation");
    }
    if (errorCodes & bms_errors.input_power_supply) {
        warnings.push_back("Input Power Supply");
    }
    if (errorCodes & bms_errors.charge_limit_enforcement) {
        warnings.push_back("Charge Limit Enforcement");
    }
    return warnings;
}

// Functions to get variable values
// { // Brackets for collapsability
double Backend::motorTemp() const {
    return m_motorTemp;
}

double Backend::auxVoltage() const {
    return m_auxVoltage;
}

double Backend::auxPercent() const {
    return m_auxPercent;
}

double Backend::packSOC() const {
    return m_packSOC;
}

double Backend::packVoltage() const {
    return m_packVoltage;
}

double Backend::highCellTemp() const {
    return m_highCellTemp;
}

double Backend::lowCellTemp() const {
    return m_lowCellTemp;
}

double Backend::bmsTemp() const {
    return m_bmsTemp;
}

double Backend::motorSpeed() const {
    return m_motorSpeed;
}

double Backend::bikeSpeed() const {
    return m_bikeSpeed;
}

double Backend::mcTemp() const {
    return m_mcTemp;
}

bool Backend::bmsFault() const {
    return m_bmsFault;
}

bool Backend::mcFault() const {
    return m_mcFault;
}

bool Backend::motorOn() const {
    return m_motorOn;
}

int Backend::bikeStatus() const {
    return m_bikeStatus;
}

double Backend::packCurrent() const {
    return m_packCurrent;
}

bool Backend::bmsError() const {
    return m_bmsError;
}

bool Backend::bmsWarning() const {
    return m_bmsWarning;
}

uint32_t Backend::bmsErrorCodes() const {
    return m_bmsErrorCodes;
}

std::vector<QString> Backend::bmsErrorCodesString() const {
    return m_bmsErrorCodesString;
}

// }

// Setter Functions
// { // Brackets for collapsability
void Backend::setMotorTemp(const double temp) {
    if (m_motorTemp != temp) {
        m_motorTemp = temp;
        emit motorTempChanged();
    }
}

void Backend::setAuxVoltage(const double cap) {
    if (m_auxVoltage != cap) {
        m_auxVoltage = cap;
        emit auxVoltageChanged();
    }
}

void Backend::setAuxPercent(const double cap) {
    if (m_auxPercent != cap) {
        m_auxPercent = cap;
        emit auxPercentChanged();
    }
}

void Backend::setPackSOC(const double soc) {
    if (m_packSOC != soc) {
        m_packSOC = soc;
        emit packSOCChanged();
    }
}

void Backend::setPackVoltage(const double voltage) {
    if (m_packVoltage != voltage) {
        m_packVoltage = voltage;
        emit packVoltageChanged();
    }
}

void Backend::setHighCellTemp(const double temp) {
    if (m_highCellTemp != temp) {
        m_highCellTemp = temp;
        emit highCellTempChanged();
    }
}

void Backend::setLowCellTemp(const double temp) {
    if (m_lowCellTemp != temp) {
        m_lowCellTemp = temp;
        emit lowCellTempChanged();
    }
}

void Backend::setBmsTemp(const double temp) {
    if (m_bmsTemp != temp) {
        m_bmsTemp = temp;
        emit bmsTempChanged();
    }
}

void Backend::setMotorSpeed(const double speed) {
    if (m_motorSpeed != speed) {
        m_motorSpeed = speed;
        emit motorSpeedChanged();
    }
}

void Backend::setBikeSpeed(const double speed) {
    if (m_bikeSpeed != speed) {
        m_bikeSpeed = speed;
        emit bikeSpeedChanged();
    }
}

void Backend::setMcTemp(const double temp) {
    if (m_mcTemp != temp) {
        m_mcTemp = temp;
        emit mcTempChanged();
    }
}

void Backend::setBmsFault(const bool fault) {
    if (m_bmsFault != fault) {
        m_bmsFault = fault;
        emit bmsFaultChanged();
    }
}

void Backend::setMcFault(const bool fault) {
    if (m_mcFault != fault) {
        m_mcFault = fault;
        emit mcFaultChanged();
    }
}

void Backend::setMotorOn(const bool on) {
    if (m_motorOn != on) {
        m_motorOn = on;
        emit motorOnChanged();
    }
}

void Backend::setBikeStatus(const int status) {
    if (m_bikeStatus != status) {
        m_bikeStatus = status;
        emit bikeStatusChanged();
    }
}

void Backend::setPackCurrent(const double current) {
    if (m_packCurrent != current) {
        m_packCurrent = current;
        emit packCurrentChanged();
    }
}

void Backend::setBmsError(const bool error) {
    if (m_bmsError != error) {
        m_bmsError = error;
        emit bmsErrorChanged();
    }
}

void Backend::setBmsWarning(const bool warning) {
    if (m_bmsWarning != warning) {
        m_bmsWarning = warning;
        emit bmsWarningChanged();
    }
}

void Backend::setBmsErrorCodes(const uint32_t warnings) {
    if (m_bmsErrorCodes != warnings) {
        m_bmsErrorCodes = warnings;
        emit bmsErrorCodesChanged();
    }
}

void Backend::setBmsErrorCodesString(const std::vector<QString> warnings) {
    if (m_bmsErrorCodesString != warnings) {
        m_bmsErrorCodesString = warnings;
        emit bmsErrorCodesStringChanged();
    }
}
// }

void parserStuff() {
    using namespace std;
    // --------------------------------------------------------
    // ------------  CONFIGURE GPS SERVICE  -------------------
    // --------------------------------------------------------

    // Create a GPS service that will keep track of the fix data.
    NMEAParser parser;
    GPSService gps(parser);
    // parser.log = true;		// true: will spit out all sorts of parse info on each sentence.

    // Handle events when the lock state changes
    gps.onLockStateChanged += [](bool newlock) {
        if (newlock) {
            cout << "\t\t\tGPS aquired LOCK!" << endl;
        } else {
            cout << "\t\t\tGPS lost lock. Searching..." << endl;
        }
    };

    // Handle any changes to the GPS Fix... This is called after onSentence
    gps.onUpdate += [&gps]() {
        cout << "\t\t\tPosition: " << gps.fix.latitude << "'N, " << gps.fix.longitude << "'E" << endl
             << endl;
    };

    // (optional) - Handle events when the parser receives each sentence
    parser.onSentence += [&gps](const NMEASentence &n) {
        cout << "Received " << (n.checksumOK() ? "good" : "bad") << " GPS Data: " << n.name << endl;
    };

    cout << "-------- Reading GPS NMEA data --------" << endl;

    // --------------------------------------------------------
    // ---------------   STREAM THE DATA  ---------------------
    // --------------------------------------------------------
    try {
        // From a buffer in memory...
        //   cout << ">> [ From Buffer]" << endl;
        //   parser.readBuffer((uint8_t*)bytestream, sizeof(bytestream));
        // ---------------------------------------

        // -- OR --
        // From a device byte stream...
        //   cout << ">> [ From Device Stream]" << endl;
        //   parser.readByte(byte_from_device);
        // ---------------------------------------

        // -- OR --
        // From a text log file...
        cout << ">> [ From File]" << endl;
        string line;
        ifstream file("nmea_log.txt");
        while (getline(file, line)) {
            try {
                parser.readLine(line);
            } catch (NMEAParseError &e) {
                cout << e.message << endl
                     << endl;
                // You can keep feeding data to the gps service...
                // The previous data is ignored and the parser is reset.
            }
        }
    } catch (exception &e) {
        // Notify the proper authorities. Something is on fire.
        cout << "Something Broke: " << e.what() << endl;
    }
    // ---------------------------------------

    // Show the final fix information
    // cout << gps.fix.toString() << endl;

    // --------------------------------------------------------
    // ---------------   NMEA ALTERNATIVE SENTENCES  ----------
    // --------------------------------------------------------
    // Not using GPS NMEA Sentences? That's A-OK.
    // While there is no data aggregation code written here for
    // non-GPS use, the parser will still make your job easier.
    // Extract only the sentences you care about.

    // Create our custom parser...
    NMEAParser custom_parser;
    // parser.log = true;
    custom_parser.setSentenceHandler("MYNMEA", [](const NMEASentence &n) {
        cout << "Handling $" << n.name << ":" << endl;
        for (size_t i = 0; i < n.parameters.size(); ++i) {
            cout << "    [" << i << "] \t- " << n.parameters[i];
            try {
                double num = parseDouble(n.parameters[i]);
                cout << "      (number: " << num << ")";
            } catch (NumberConversionError &) {
                cout << " (string)";
            }
            cout << endl;
        }
    });
    custom_parser.onSentence += [](const NMEASentence &n) {
        cout << "Received $" << n.name << endl;
    };

    cout << "-------- Reading non-GPS NMEA data --------" << endl;

    // Read the data stream...
    // These don't have correct checksums. They're made up.
    char data[] = "  $MYNMEA,1,3,3,7,Hello*A2\n		\
                    $IRRELEVANT,5,5,5*AA\n			\
                    $ERRORS,:D,\n					\
                    $\n								\
                    $$\n							\
                    $*\n							\
                    $*,\n							\
                    $,\n							\
                    $,*\n							\
                    garbage that will be			\
                    !IgN0r3d @)(&%!!!				\
                    $MYNMEA,1,3,3,7,World!*A2\r\n	\
                    ";
    for (int i = 0; i < sizeof(data); i++) {
        try {
            custom_parser.readByte(data[i]);
        } catch (NMEAParseError &e) {
            cout << e.what() << endl;
        }
    }

    // --------------------------------------------------------
    // ---------------   NMEA SENTENCE GENERATION  ------------
    // --------------------------------------------------------
    // Some devices allow control sentences to be sent to them.
    // For some GPS devices this can allow selecting certain data.
    // Only the following 2 Sentences are implemented, however
    // you can create your own from the NMEACommand base class.

    // Test the parser and command generation
    NMEACommand cmd1;                    // A blank generic command
    NMEACommandQueryRate cmd2;           // The $PSRF command that allows for GPS sentence selection and rate setting.
    NMEACommandQueryRate cmd3;           // The $PSRF command that allows for GPS sentence selection and rate setting.
    NMEACommandSerialConfiguration cmd4; // The $PSRF command that can configure a UART baud rate.
    NMEAParser test_parser;
    test_parser.onSentence += [&cmd1, &cmd2, &cmd3, &cmd4](const NMEASentence &n) {
        cout << "Received:  " << n.text;

        if (!n.checksumOK()) {
            cout << "\t\tChecksum FAIL!" << endl;
        } else {
            cout << "\t\tChecksum PASS!" << endl;
        }
    };

    cout << "-------- NMEA Command Generation --------" << endl;

    // Just filling it with something. Could be whatever you need.
    cmd1.name = "CMD1";
    cmd1.message = "nothing,special";

    // Config output rate for $GPGGA sentence
    cmd2.messageID = NMEASentence::MessageID::GGA;
    cmd2.mode = NMEACommandQueryRate::QueryRateMode::SETRATE;
    cmd2.rate = 3; // output every 3 seconds, 0 to disable

    // Query $GPGSV almanac sentence just this once
    cmd3.messageID = NMEASentence::MessageID::GSV;
    cmd3.mode = NMEACommandQueryRate::QueryRateMode::QUERY;

    // Set the Baud rate to 9600, because this GPS chip is awesome
    cmd4.baud = 9600; // 4800 is NMEA standard

    // Generate the NMEA sentence from the commands and send them back into the test parser.
    test_parser.readSentence(cmd1.toString());
    test_parser.readSentence(cmd2.toString());
    test_parser.readSentence(cmd3.toString());
    test_parser.readSentence(cmd4.toString());

    cout << endl;
    cout << endl;
    cout << "-------- ALL DONE --------" << endl;

    cin.ignore();
}

std::thread can_thread(can::run);
