import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Bolt_Dash

Item {
	width: Constants.width
    height: Constants.height

    // Properties, all defined as doubles
    property double gpsLat: 0.0
    property double gpsLong: 0.0

    // Using grid layout for organized display
    GridLayout {
		y: 30
        columns: 2
        columnSpacing: 10
        rowSpacing: 5
        width: parent.width
        height: parent.height - y

        // Labels and dynamic text for each data item, converting double to string for display
        Text { text: "Latitude:" }
        Text { text: qsTr("%1").arg(gpsLat) }

        Text { text: "Longitude:" }
        Text { text: qsTr("%1").arg(gpsLong) }
    }

	Text {
		text: "Other Information"
		color: "blue"
		font.pixelSize: 24
	}
}
