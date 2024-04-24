import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Studio.Components
import QtCharts
import QtQuick.Shapes

Item {
    Image {
        id: image
        x: -(295/2)
        y: 20
        width: 295
        height: 164
        source: "Pictures/leanAngleBack.png"
        fillMode: Image.PreserveAspectFit
    }
    Path{
        startX:100;startY:150
        PathLine:{
            x:100
            y:100
        }
        PathSvg{ path: "L 150 50 L 100 150 z" }
    }
    Path {
        startX: 50; startY: 50
        PathSvg { path: "L 150 50 L 100 150 z" }
    }
}
