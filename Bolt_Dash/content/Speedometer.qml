
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

        Canvas {
            id: curveCanvas
            anchors.fill: parent

            onPaint: {
                var ctx = getContext("2d");

                ctx.clearRect(0, 0, width, height);

                ctx.strokeStyle = "blue";
                ctx.lineWidth = 24;

                // Define the quadratic curve equation
                function quadraticCurveEquation(x) {
                    // Example equation: y = x^2 / 100
                    return root.height-(Math.pow(x-12,1/6)*39);
                }

                // Specify the range of x values
                var startX = 12;     // Start x-coordinate
                var endX = 600*root.parent.speedoPercent;     // End x-coordinate
                var stepSize = 2;   // Step size for x values

                ctx.beginPath();

                // Move to the starting point
                ctx.moveTo(startX, quadraticCurveEquation(startX));

                // Draw the curve by connecting points
                for (var x = startX + stepSize; x <= endX; x += stepSize) {
                    var y = quadraticCurveEquation(x);
                    ctx.lineTo(x, y);
                }

                ctx.stroke();
            }
        }
    }
}

