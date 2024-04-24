import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Studio.Components
import QtCharts
import QtQuick.Shapes

Item {
    property int ang: 60
    width: 500
    height: 500
    Image {
        id: image
        x: -(295/2)
        y: 20
        width: 295
        height: 164
        source: "Pictures/leanAngleBack.png"
        fillMode: Image.PreserveAspectFit
    }

    Rectangle{

    }

    Rectangle {
        id: correctDial
        width: 5
        height: 150
        x: -width/2
        y: 60
        transformOrigin: Item.Bottom
        rotation: ang
    }
}
