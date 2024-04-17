import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Studio.Components
import QtCharts

Item {
    width: 1920
    height: 1080
    property TextureInput background: null

    Image {
        id: image
        x: 436
        y: 442
        width: 295
        height: 164
        source: "../../../OneDrive - Virginia Tech/Pictures/leanAngleBack.png"
        fillMode: Image.PreserveAspectFit
    }


}
