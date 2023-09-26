import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: 120
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
        width: 120
        height: 350
        border.width: 3
        color: `#${integerToHex(254 - (fullness * 245))}${integerToHex(12+(fullness*177))}${integerToHex(13+(fullness*-2))}`;
    }

    Rectangle {
        id: level
        x: 0
        y: 0
        width: 120
        height: 350-(350*fullness)
        color: "white"
        border.width: 3
    }
}
