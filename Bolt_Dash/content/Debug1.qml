import QtQuick 2.15
import QtQuick.Shapes

Item {
    DebugItem1 {
        id: debug1
        motorTemp: backend.motorTemp
        auxVoltage: backend.auxVoltage
        auxPercent: backend.auxPercent
        packSOC: backend.packSOC
        packVoltage: backend.packVoltage
        highCellTemp: backend.highCellTemp
        lowCellTemp: backend.lowCellTemp
        bmsTemp: backend.bmsTemp
        motorSpeed: backend.motorSpeed
        bikeSpeed: backend.bikeSpeed
    }
}
