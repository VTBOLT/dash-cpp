import QtQuick 2.15
import QtQuick.Shapes

import "DebugHelpers"

Item {
    DebugItem1 {
        visible: menu.selected == DebugMain.Selected.OVERVIEW
        width: 650
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

    DebugMotor {
        visible: menu.selected == DebugMain.Selected.MOTOR
        width: 650
        id: debugMotor
    }

    DebugBMS {
        visible: menu.selected == DebugMain.Selected.BMS
        width: 650
        id: debugBMS
    }

    DebugPDU {
        visible: menu.selected == DebugMain.Selected.PDU
        width: 650
        id: debugPDU
    }

    DebugMain {
        id: menu
        x: 650
        y: 0
        width: 150
        selected: DebugMain.Selected.OVERVIEW
    }
}
