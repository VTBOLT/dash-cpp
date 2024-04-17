import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Studio.Components
import QtCharts

Item {
    Image {
        id: image
        x: -200
        y: 20
        width: 295
        height: 164
        source: "Pictures\leanAngleBack.png"
        fillMode: Image.PreserveAspectFit
    }

    ArcItem {
        id: arc1
        x: -200
        y: 20
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
