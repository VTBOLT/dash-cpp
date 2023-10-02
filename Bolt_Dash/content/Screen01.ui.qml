

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import Bolt_Dash

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor

    Speedometer {
        id: speedometer
        x: 50
        y: 24
    }

    Slider {
        id: slider
        x: -274
        y: 209
        width: 600
        height: 48
        scale: 0.5
        rotation: -90
        value: 0.5
    }

    BatterySlider {
        id: packSlider
        x: 25
        y: 175
        scale: 0.5
        fullness: slider.value
    }

    BatterySlider {
        id: auxSlider
        x: 125
        y: 175
        scale: 0.5
        fullness: slider.value
    }

    Text {
        id: packLabel
        x: 61
        y: 444
        width: 48
        height: 29
        text: qsTr("PACK")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: auxLabel
        x: 161
        y: 443
        width: 48
        height: 29
        text: qsTr("AUX")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    TempSlider {
        id: tempSlider
        x: 660
        y: 175
        scale: 0.5
        fullness: 1 - slider.value
    }

    Text {
        id: packTempLabel
        x: 696
        y: 444
        width: 48
        height: 29
        text: qsTr("PACK")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    TempSlider {
        id: tempSlider1
        x: 560
        y: 175
        scale: 0.5
        fullness: 1 - slider.value
    }

    Text {
        id: mcTempLabel
        x: 596
        y: 444
        width: 48
        height: 29
        text: qsTr("MC")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    TempSlider {
        id: tempSlider2
        x: 460
        y: 175
        scale: 0.5
        fullness: 1 - slider.value
    }

    Text {
        id: motorTempLabel
        x: 496
        y: 444
        width: 48
        height: 29
        text: qsTr("MOTOR")
        font.pixelSize: 20
        horizontalAlignment: Text.AlignHCenter
    }

    Text {
        id: text1
        x: 263
        y: 105
        width: 274
        height: 160
        text: qsTr("174")
        font.pixelSize: 125
        horizontalAlignment: Text.AlignHCenter
        font.family: "Verdana"
    }
}
