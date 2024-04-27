import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 40
    height: 275
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
        height: parent.height - bubble.height
        color: "black";
        border.width: 3
        border.color: "white"
    }

    Rectangle {
        id: level
        radius: 10
        x: 0
        y: enclosing.height-(enclosing.height*fullness) > 0 ? enclosing.height-(enclosing.height*fullness) : 0
        width: parent.width
        height: (enclosing.height*fullness)
        // color: `#${integerToHex(9 + (fullness * 223))}${integerToHex(189-(fullness*177))}${integerToHex(15+(fullness*-3))}`;
        color: fullness > 0.9 ? red : "white";
        border.width: 3
        border.color: "white"
    }

    Rectangle {
        id: bubble
        x: -(width-enclosing.width)/2
        y: enclosing.height
        height: 100
        width: 100
        radius: width/2
        color: fullness > 0.9 ? red : "white"
        border.width: 3
    }


    Rectangle {
        id: bubblebg
        x: enclosing.x
        y: bubble.y - enclosing.radius/2 - 1
        // radius: level.radius
        height: 50
        width: enclosing.width
        color: bubble.color
    }
}
