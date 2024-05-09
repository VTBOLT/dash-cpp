import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Shapes 

Item {
    width: 400
    height: 150
    property bool motorOn: false
    property bool bmsFault: false
    property bool mcFault: false
    readonly property string red: "#e80c0c"
    readonly property string green: "#54c45e"
    readonly property int padding: 10
    readonly property color good: green
    readonly property color bad: red 
    readonly property color off: "black"   
    id: root 

    // Motor On
    Rectangle {
        id: motorOnIndicator
        x: width
        y: 0
        width: 100
        height: width
        radius: width/2
        color: "transparent"
        border.width: 5
        border.color: "white"

        // Indicator circle
        Rectangle {
            readonly property int offset: 15
            x: offset
            y: offset
            width: parent.width - offset*2
            height: width
            radius: width/2
            color: motorOn ? good : off
        }
    }

    // Motor On Indicator text
    Rectangle {
        x: 0
        y: motorOnIndicator.y + motorOnIndicator.height
        id: motorOnIndicatorRect
        width: motorOnIndicatorText.width + padding*2
        height: motorOnIndicatorText.height + padding
        color: "transparent"
        border.width: 2
        border.color: "white"
        radius: 10

        Text {
            id: motorOnIndicatorText
            anchors.centerIn: parent    
            text: "Motor On"
            font.pixelSize: 20
            color: "white"
            verticalAlignment: Text.AlignVCenter
        }
    }

    Shape {
        ShapePath {
            id: motorOnIndicatorConnector
            strokeColor: "white"
            strokeWidth: 2
            fillColor: "transparent"
            startX: motorOnIndicatorRect.x + motorOnIndicatorRect.width/2
            startY: motorOnIndicatorRect.y
            PathCurve {
                x: motorOnIndicatorConnector.startX+10; y: motorOnIndicator.y+4*motorOnIndicator.height/5
            }
            PathCurve {
                x: motorOnIndicator.x+5; y: motorOnIndicator.y+2*motorOnIndicator.height/3
            }
        }
    }

    // BMS Fault
    Button {
        id: bmsFaultIndicator
        x: motorOnIndicator.x + motorOnIndicator.width + padding
        y: 7
        width: 50
        height: width
        onClicked: {
            bmsFault = !bmsFault
            bmsFaultDetails.show()
        }
        flat: true
        indicator: Rectangle {
            // id: bmsFaultIndicator
            // x: motorOnIndicator.x + motorOnIndicator.width + padding
            // y: 7
            x: 0
            y: 0
            width: 50
            height: width
            radius: width/2
            color: "transparent"
            border.width: 5
            border.color: "white"

            // Indicator circle
            Rectangle {
                readonly property int offset: 12
                x: offset
                y: offset
                width: parent.width - offset*2
                height: width
                radius: width/2
                color: bmsFault ? bad : off
            }
        }
    }

    // BMS Fault Indicator text
    Rectangle {
        x: bmsFaultIndicator.x + bmsFaultIndicator.width + padding
        y: bmsFaultIndicator.y - 2*bmsFaultIndicator.height/5
        id: bmsFaultIndicatorRect
        width: bmsFaultIndicatorText.width + padding*2
        height: bmsFaultIndicatorText.height + padding
        color: "transparent"
        border.width: 2
        border.color: "white"
        radius: 10

        Text {
            id: bmsFaultIndicatorText
            anchors.centerIn: parent    
            text: "BMS Fault"
            font.pixelSize: 20
            color: "white"
            verticalAlignment: Text.AlignVCenter
        }
    }

    Shape {
        ShapePath {
            id: bmsFaultIndicatorConnector
            strokeColor: "white"
            strokeWidth: 2
            fillColor: "transparent"
            startX: bmsFaultIndicatorRect.x + bmsFaultIndicatorRect.width/2
            startY: bmsFaultIndicatorRect.y  + bmsFaultIndicatorRect.height
            PathCurve {
                x: bmsFaultIndicatorConnector.startX-10; y: bmsFaultIndicator.y+3*bmsFaultIndicator.height/5
            }
            PathCurve {
                x: bmsFaultIndicator.x+bmsFaultIndicator.width - 1; y: bmsFaultIndicator.y+2*bmsFaultIndicator.height/3
            }
        }
    }

    // MC Fault
    Rectangle {
        id: mcFaultIndicator
        x: bmsFaultIndicator.x
        y: bmsFaultIndicator.y + bmsFaultIndicator.height + padding
        width: 75
        height: width
        radius: width/2
        color: "transparent"
        border.width: 5
        border.color: "white"

        // Indicator circle
        Rectangle {
            readonly property int offset: 13
            x: offset
            y: offset
            width: parent.width - offset*2
            height: width
            radius: width/2
            color: mcFault ? bad : off
        }
    }

    // MC Fault Indicator Text
    Rectangle {
        x: bmsFaultIndicatorRect.x + padding
        y: mcFaultIndicator.y - 1*mcFaultIndicator.height/5
        id: mcFaultIndicatorRect
        width: mcFaultIndicatorText.width + padding*2
        height: mcFaultIndicatorText.height + padding
        color: "transparent"
        border.width: 2
        border.color: "white"
        radius: 10

        Text {
            id: mcFaultIndicatorText
            anchors.centerIn: parent    
            text: "MC Fault"
            font.pixelSize: 20
            color: "white"
            verticalAlignment: Text.AlignVCenter
        }
    }

    Shape {
        ShapePath {
            id: mcFaultIndicatorConnector
            strokeColor: "white"
            strokeWidth: 2
            fillColor: "transparent"
            startX: mcFaultIndicatorRect.x + mcFaultIndicatorRect.width/2
            startY: mcFaultIndicatorRect.y  + mcFaultIndicatorRect.height
            PathCurve {
                x: mcFaultIndicatorConnector.startX-10; y: mcFaultIndicator.y+3*mcFaultIndicator.height/5
            }
            PathCurve {
                x: mcFaultIndicator.x + mcFaultIndicator.width - 2; y: mcFaultIndicator.y+2*mcFaultIndicator.height/3
            }
        }
    }

    BMSFaultDetails {
        id: bmsFaultDetails
    }
}
