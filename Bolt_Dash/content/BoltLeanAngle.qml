import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Studio.Components
import QtCharts

Item {
    Image {
        id: image
        x: -200
        y: 50
        width: 400
        height: 400
        source: "../../../OneDrive - Virginia Tech/Pictures/Screenshots/Screenshot 2024-04-10 190810.png"
        clip: true
        fillMode: image.PreserveAspectFit
    }

    ArcItem {
        id: arc1
        x: -200
        y: 50
        width: 400
        height: 400
        end: 225
        begin: 135
        layer.enabled: false
        clip: false
        strokeColor: "#007550"
        roundEnd: false
        roundBegin: false
        strokeStyle: 1
        strokeWidth: 75
        rotation: 180
        fillColor: "#00000000"

        Rectangle {
            id: rectangle
            x: 198
            y: 275
            width: 5
            height: 125
            color: "#000000"
            rotation: 0
        }
    }
}
