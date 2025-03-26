import QtQuick 2.15
import QtQuick.Shapes

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
        longitude: backend.lon
        latitude: backend.lat
    }

    DebugMotor {
        visible: menu.selected == DebugMain.Selected.MOTOR
        width: 650
        id: debugMotor
        motorTemp: backend.motorTemp
        motorSpeed: backend.motorSpeed
        bikeSpeed: backend.bikeSpeed
        mcTemp: backend.mcTemp
        mcFault: backend.mcFault
        motorOn: backend.motorOn
    }

    DebugBMS {
        visible: menu.selected == DebugMain.Selected.BMS
        width: 650
        id: debugBMS
        packSOC: backend.packSOC
        highCellTemp: backend.highCellTemp
        lowCellTemp: backend.lowCellTemp
        bmsTemp: backend.bmsTemp
        packVoltage: backend.packVoltage
        packCurrent: backend.packCurrent
        bmsFault: backend.bmsFault
        bmsErrorCodes: bmsErrorCodes
        bmsError: backend.bmsError
        bmsWarning: backend.bmsWarning
        bmsErrorCodesString: backend.bmsErrorCodesString
    }

    DebugPDU {
        visible: menu.selected == DebugMain.Selected.PDU
        width: 650
        id: debugPDU
        auxVoltage: backend.auxVoltage
        auxPercent: backend.auxPercent
        bikeStatus: backend.bikeStatus
    }

    DebugOther {
        visible: menu.selected == DebugMain.Selected.OTHER
        width: 650
        id: debugOther
        gpsLat: backend.lat
        gpsLong: backend.lon
    }

    DebugMain {
        id: menu
        x: 650
        y: 0
        width: 150
        selected: DebugMain.Selected.OVERVIEW
    }
}
