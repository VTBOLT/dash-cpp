
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

    readonly property int textLabelY: 435
    readonly property int sliderY: 175
    readonly property int valueLabelY: textLabelY+20

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

    BatterySlider {
        id: packSlider
        x: 28
        y: sliderY
        scale: 0.5
        fullness: backend.packSOC     // Percent to decimal
    }

    BatterySlider {
        id: auxSlider
        x: 98
        y: sliderY
        scale: 0.5
        fullness: backend.auxPercent      // Percent to decimal
    }

    // Max battery percentages
    Text {
        x: 36
        y: sliderY + 60
        text: qsTr("100%")
        font.pixelSize: 20
    }
    Text {
        x: 106
        y: sliderY + 60
        text: qsTr("100%")
        font.pixelSize: 20
    }

    Text {
        id: packLabel
        x: 36
        y: textLabelY
        width: 48
        height: 29
        text: qsTr("PACK")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: auxLabel
        x: 104
        y: textLabelY
        width: 48
        height: 29
        text: qsTr("AUX")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
    }


    TempSlider {
        id: packTempSlider
        x: 715
        y: sliderY
        scale: 0.5
        fullness: backend.highCellTemp / 100 // Abosulte max of 100C and divide by 2 for avg
    }

    Text {
        id: packTempLabel
        x: 723
        y: textLabelY
        width: 48
        height: 29
        text: qsTr("PACK")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
    }

    // Pack max temp label
    Text {
        x: packTempLabel.x
        y: sliderY + 60
        text: qsTr("100°C")
        font.pixelSize: 20
    }

    TempSlider {
        id: mCTempSlider
        x: 644
        y: sliderY
        scale: 0.5
        fullness: backend.mcTemp / 100 // Abosulte max of 100C
    }

    Text {
        id: mcTempLabel
        x: 652
        y: textLabelY
        width: 48
        height: 29
        text: qsTr("MC")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
    }

    // MC max temp label
    Text {
        x: mcTempLabel.x
        y: sliderY + 60
        text: qsTr("100°C")
        font.pixelSize: 20
    }

    TempSlider {
        id: motorTempSlider
        x: 568
        y: sliderY
        scale: 0.5
        fullness: backend.motorTemp / 115 // Abosulte max of 115C
    }

    Text {
        id: motorTempLabel
        x: 572
        y: textLabelY
        width: 48
        height: 29
        text: qsTr("MOTOR")
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
    }

    // Motor max temp label
    Text {
        x: motorTempLabel.x
        y: sliderY + 60
        text: qsTr("115°C")
        font.pixelSize: 20
    }

    Text {
        id: speedoLabel
        x: 263
        y: 105
        width: 274
        height: 160
        text: qsTr("%1").arg(Math.round(backend.bikeSpeed))
        font.pixelSize: 125  // For showing speed in mph
        horizontalAlignment: Text.AlignHLeft
        font.family: "Nasalization"
    }

    WarningSymbol {
        id: warningSymbol
        x: 626
        y: 127
    }

    BoltLeanAngle {
        id: leanAngle
        x: Constants.width / 2
        y: Constants.height / 2
    }
}
