import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Bolt_Dash

import ".."

Item {
	width: Constants.width
    height: Constants.height

    // Properties, all defined as doubles
    property double auxVoltage: 0.0
	property double auxPercent: 0.0
	property int bikeStatus: 0

    // Using grid layout for organized display
    GridLayout {
		y: 30
        columns: 2
        columnSpacing: 10
        rowSpacing: 10
        width: parent.width
        height: parent.height - y

        // Labels and dynamic text for each data item, converting double to string for display
        Text { text: "Aux Voltage:" }
		Text { text: auxVoltage.toFixed(2) + " V" }

		Text { text: "Aux Percent:" }
		Text { text: auxPercent.toFixed(2) + " %" }

		Text { text: "Bike Status:" }
		Text { text: switch (bikeStatus) {
			case BikeStatus.Status.STANDBY:
				return "Standby"
			case BikeStatus.Status.ACCESSORY:
				return "Accessory"
			case BikeStatus.Status.CHECKING:
				return "Checking"
			case BikeStatus.Status.READY:
				return "Ready"
			case BikeStatus.Status.DRIVE:
				return "Drive"
			case BikeStatus.Status.FAULT:
				return "Fault"
		} }
    }

	Text {
		text: "PDU"
		color: "blue"
		font.pixelSize: 24
	}
}
