import QtQuick 2.15 
import QtQuick.Controls 
import QtQuick.Shapes

Window{
    x: 0
    y: 0
    width: 400
    height: 400

    Column {
        Repeater {
            model: getBMSWarnings()
            Text {
                required property string modelData
                text: modelData
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