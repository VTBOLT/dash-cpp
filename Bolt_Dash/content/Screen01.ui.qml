

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
        x: 100
        y: 31
    }

    Slider {
        id: slider
        x: 100
        y: 205
        width: 600
        height: 48
        value: 0.5
        onMoved: batterySlider.fullness = slider.value
    }

    BatterySlider {
        id: packSlider
        x: 25
        y: 175
        scale: 0.5
    }

    BatterySlider {
        id: auxSlider
        x: 125
        y: 175
        scale: 0.5
    }

    Text {
        id: packLabel
        x: 61
        y: 444
        width: 48
        height: 29
        text: qsTr("PACK")
        font.pixelSize: 20
    }

    Text {
        id: auxLabel
        x: 168
        y: 444
        width: 48
        height: 29
        text: qsTr("AUX")
        font.pixelSize: 20
    }
}
