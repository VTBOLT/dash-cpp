import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 100
    height: 480
    property int selected: DebugMain.Selected.OVERVIEW

    enum Selected {
        OVERVIEW,
        MOTOR,
        BMS,
        PDU
    }

    Column {
        id: column
        property int numButtons: 4
        y: spacing
        spacing: 3
        width: parent.width
        height: parent.height
        Repeater {
            model: column.numButtons
            Rectangle {
                radius: 2
                height: parent.height / column.numButtons - parent.spacing - 1
                width: parent.width
                color: selected === modelData ? "lightgrey" : "grey"

                Text {
                    height: parent.height
                    width: parent.width
                    text: {
                        switch (modelData) {
                        case DebugMain.Selected.OVERVIEW:
                            return "Overview"
                        case DebugMain.Selected.MOTOR:
                            return "Motor"
                        case DebugMain.Selected.BMS:
                            return "BMS"
                        case DebugMain.Selected.PDU:
                            return "PDU"
                        default:
                            return "Unknown"
                        }
                    }
                    color: "black"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    elide: Text.ElideRight
                }
                Button {
                    flat: true
                    width: parent.width
                    height: parent.height
                    onClicked: {
                        selected = modelData
                    }
                }
            }

        }
    }
}
