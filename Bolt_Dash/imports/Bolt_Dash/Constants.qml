pragma Singleton
import QtQuick 6.2
import QtQuick.Studio.Application

QtObject {
    readonly property int width: 800
    readonly property int height: 480

    property string relativeFontDirectory: "fonts"

    /* Edit this comment to add your custom font */
    readonly property font font: Qt.font({
                                             family: Qt.application.font.family,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: Qt.application.font.family,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })

    readonly property color backgroundColor: "#000000"
    readonly property color textColor: "#ffffff"
    readonly property color errColor: "#ff0000"


    property StudioApplication application: StudioApplication {
        fontPath: Qt.resolvedUrl("../../content/" + relativeFontDirectory)
    }
}
