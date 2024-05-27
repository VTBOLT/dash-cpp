import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Bolt_Dash

Item {
	width: Constants.width
    height: Constants.height

    // Properties, all defined as doubles
    property double motorTemp: 0.0
    property double motorSpeed: 0.0
    property double bikeSpeed: 0.0
	property double mcTemp: 0.0
	property bool mcFault: false
	property bool motorOn: false

	Text {
		text: "Motor"
		color: "blue"
		font.pixelSize: 24
	}

    // Using grid layout for organized display
    GridLayout {
		y: 30
        columns: 2
        columnSpacing: 10
        rowSpacing: 10
        width: parent.width
        height: parent.height - 30

        // Labels and dynamic text for each data item, converting double to string for display
        Text { text: "Motor Temperature:" }
        Text { text: qsTr("%1°C").arg(backend.motorTemp) }

		Text { text: "Motor Controller Temperature:" }
		Text { text: qsTr("%1°C").arg(backend.mcTemp) }

        Text { text: "Motor Speed:" }
        Text { text: qsTr("%1 RPM").arg(motorSpeed) }

		Text { text: "Bike Speed:" }
		Text { text: qsTr("%1 mph").arg(bikeSpeed) }

		Text { text: "Motor Controller Fault:" }
		Text { text: mcFault ? "Yes" : "No" }

		Text { text: "Motor On:" }
		Text { text: motorOn ? "Yes" : "No" }
    }
}
