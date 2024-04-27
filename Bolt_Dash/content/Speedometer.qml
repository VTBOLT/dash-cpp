/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 2.15
import Bolt_Dash 1.0
// import QtQuick.Components


Item {
    visible: true
    id: container
    width: 700
    height: 75
    property double fullness: 0.5;

    Rectangle {
        id: root
        width: parent.width
        height: parent.height
        radius: 15
        border.color: "#616161"
        border.width: 10

        Rectangle {
            id: rectangle
            radius: 15
            x: 10
            y: 10
            width: 680*fullness
            height: 55
            color: "#0c00ff"
        }
    }
}

