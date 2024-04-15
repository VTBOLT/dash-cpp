import QtQuick 2.15
import Backend

Item {
    Backend {
        id: backend
        motorTemp: 0
        auxVoltage: 0
        auxPercent: 0
        packSOC: 0
        highCellTemp: 0
        lowCellTemp: 0
        bmsTemp: 0
        motorSpeed: 0
        bikeSpeed: 0
    }

    DebugItem1 {
        id: debug1
        motorTemp: backend.motorTemp
        auxVoltage: backend.auxVoltage
        auxPercent: backend.auxPercent
        packSOC: backend.packSOC
        highCellTemp: backend.highCellTemp
        lowCellTemp: backend.lowCellTemp
        bmsTemp: backend.bmsTemp
        motorSpeed: backend.motorSpeed
        bikeSpeed: backend.bikeSpeed
    }
}
