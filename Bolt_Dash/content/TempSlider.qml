import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 60
    height: 300
    readonly property string red: "#e80c0c"
    readonly property string green: "#09bd0f"
    property double fullness: 0.5;

    function integerToHex(num){
        let hexString = Math.floor(num).toString(16);
        if (hexString.length === 1){
            hexString = "0" + hexString;
        }
        return hexString;
    }

    Rectangle {
        id: enclosing
        radius: 10
        x: 0
        y: 0
        width: parent.width
        height: parent.height - bubble.height/2
        color: "black";
    }

    Rectangle {
        id: level
        radius: 10
        x: 0
        y: parent.height-(parent.height*fullness) > 0 ? parent.height-(parent.height*fullness) : 0
        width: parent.width
        height: (parent.height*fullness)
        // color: `#${integerToHex(9 + (fullness * 223))}${integerToHex(189-(fullness*177))}${integerToHex(15+(fullness*-3))}`;
        color: fullness > 0.9 ? red : green;
    }

    Rectangle {
        id: bubble
        x: -(width-enclosing.width)/2
        y: enclosing.height - width/3
        height: 100
        width: 100
        radius: width/2
        color: green
    }
}
