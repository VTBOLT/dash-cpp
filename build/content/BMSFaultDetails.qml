import QtQuick 2.15 
import QtQuick.Controls 
import QtQuick.Shapes

Window{
    x: 0
    y: 0
    width: 400
    height: 400

    Rectangle {
        border.color: "black"
        border.width: 2
        width: 350
        height: 300
        x: 20
        y: 5
        ScrollView {
            x: 5
            y: 5
            width: parent.width - 10
            height: parent.height - 10
            ScrollBar.horizontal.policy: ScrollBar.AlwaysOff
            ScrollBar.vertical.policy: ScrollBar.AlwaysOn
            ScrollBar.horizontal.interactive: false
            ScrollBar.vertical.interactive: true
            Column {
                Repeater {
                    model: getBMSWarnings()
                    Text {
                        required property string modelData
                        text: modelData
                    }
                }
            }
        }
    }

    Rectangle {
        border.color: "black"
        border.width: 2
        width: 350
        height: 85
        x: 20
        y: 310

        Text {
            x: 5
            y: 5
            width: parent.width - 10
            text: "Clear BMS Fault Codes?"
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            font.italic: true
        }

        Row {
            x: 10
            y: 25
            width: parent.width - 20
            spacing: 10
            Button {
                width: parent.width / 2 - 5
                text: "Yes"

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "grey"
                }
            }

            Button {
                width: parent.width / 2 - 5
                text: "No"

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: "grey"
                }
            }
        }
    }

    function getBMSWarnings() {
        var myText = []
        for (var i = 0; i < backend.bmsErrorCodesString.length; i++) {
            myText.push(backend.bmsErrorCodesString[i])
        }
        return myText
    }
}