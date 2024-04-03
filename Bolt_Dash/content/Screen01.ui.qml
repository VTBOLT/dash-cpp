
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import Bolt_Dash
import Backend

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    Speedometer {
        id: speedometer
        fullness: backend.motorSpeed / 5500 // Expected max speed of 5500 RPM
        x: 50
        y: 24
    }

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

    // Remove for production
    // Slider {
    //     id: slider
    //     x: -274
    //     y: 209
    //     width: 600
    //     height: 48
    //     scale: 0.5
    //     rotation: -90
    //     value: 0.5
    // }

    BatterySlider {
        id: packSlider
        x: 28
        y: 175
        scale: 0.5
        fullness: backend.packSOC     // Percent to decimal
    }

    BatterySlider {
        id: auxSlider
        x: 98
        y: 175
        scale: 0.5
        fullness: backend.auxPercent      // Percent to decimal
    }

    Text {
        id: packLabel
        x: 36
        y: 444
        width: 48
        height: 29
        text: qsTr("PACK")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: auxLabel
        x: 104
        y: 443
        width: 48
        height: 29
        text: qsTr("AUX")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    TempSlider {
        id: packTempSlider
        x: 715
        y: 175
        scale: 0.5
        fullness: (backend.highCellTemp+backend.lowCellTemp) / 200 // Abosulte max of 100C and divide by 2 for avg
    }

    Text {
        id: packTempLabel
        x: 723
        y: 444
        width: 48
        height: 29
        text: qsTr("PACK")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    TempSlider {
        id: mCTempSlider
        x: 644
        y: 175
        scale: 0.5
        fullness: backend.bmsTemp / 100 // Abosulte max of 100C
    }

    Text {
        id: mcTempLabel
        x: 652
        y: 444
        width: 48
        height: 29
        text: qsTr("MC")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    TempSlider {
        id: motorTempSlider
        x: 568
        y: 175
        scale: 0.5
        fullness: backend.motorTemp / 115 // Abosulte max of 115C
    }

    Text {
        id: motorTempLabel
        x: 572
        y: 444
        width: 48
        height: 29
        text: qsTr("MOTOR")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: speedoLabel
        x: 263
        y: 105
        width: 274
        height: 160
        text: qsTr(backend.bikeSpeed)
        font.pixelSize: 125
        horizontalAlignment: Text.AlignHCenter
        font.family: "Nasalization"
    }

    WarningSymbol {
        id: warningSymbol
        x: 626
        y: 127
    }
}
