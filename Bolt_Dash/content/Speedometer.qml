
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
import QtQuick.Studio.Components


Item {
    visible: true
    id: container
    width: 600
    height: 125
    property double speedoPercent: 0.5;

    Connections {
        target: container
        onSpeedoPercentChanged: {
            curveCanvas.requestPaint();
        }
    }

    Rectangle {
        id: root
        width: parent.width
        height: parent.height
    }
}

