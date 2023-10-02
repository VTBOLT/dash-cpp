import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 60
    height: 350
    readonly property string red: "#e80c0c"
    readonly property string green: "#09bd0f"
    property double fullness: 0.5;
    property string currentColor: yellow

    function integerToHex(num){
        let hexString = Math.floor(num).toString(16);
        if (hexString.length === 1){
            hexString = "0" + hexString;
        }
        return hexString;
    }

    Rectangle {
        id: enclosing
        x: 0
        y: 0
        width: 60
        height: 350
        border.width: 3
        color: `#${integerToHex(9 + (fullness * 223))}${integerToHex(189-(fullness*177))}${integerToHex(15+(fullness*-3))}`;
    }

    Rectangle {
        id: level
        x: 0
        y: 0
        width: 60
        height: 350-(350*fullness)
        color: "white"
        border.width: 3
    }
}
