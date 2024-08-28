import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Bolt_Dash

Item {
	width: Constants.width
    height: Constants.height

    // Properties, all defined as doubles
    property double packSOC: 0.0
    property double highCellTemp: 0.0
    property double lowCellTemp: 0.0
    property double bmsTemp: 0.0
    property double packVoltage: 0.0
	property bool bmsFault: false
	property double packCurrent: 0.0
	property int bmsErrorCodes: 0
	property bool bmsError: false
	property bool bmsWarning: false
	property var bmsErrorCodesString: []

    // Using grid layout for organized display
    GridLayout {
		y: 30
        columns: 2
        columnSpacing: 10
        rowSpacing: 10
        width: parent.width
        height: parent.height - y

        // Labels and dynamic text for each data item, converting double to string for display
        Text { text: "Pack State of Charge (SOC):" }
        Text { text: qsTr("%1\%").arg(packSOC*100) }

        Text { text: "PackVoltage:" }
        Text { text: qsTr("%1V").arg(packVoltage) }

		Text { text: "Pack Current:" }
		Text { text: qsTr("%1A").arg(packCurrent) }

        Text { text: "High Cell Temperature:" }
        Text { text: qsTr("%1°C").arg(highCellTemp) }

        Text { text: "Low Cell Temperature:" }
        Text { text: qsTr("%1°C").arg(lowCellTemp) }

        Text { text: "BMS Temperature:" }
        Text { text: qsTr("%1°C").arg(bmsTemp) }

		Text { text: "Any BMS Fault:" }
		Text { text: bmsFault ? "Yes" : "No" }

		Text { text: "BMS Error:" }
		Text { text: bmsError ? "Yes" : "No" }

		Text { text: "BMS Warning:" }
		Text { text: bmsWarning ? "Yes" : "No" }

		Text { text: "BMS Error Codes:" }
		Text { text: bmsErrorCodesString.length != 0 ? bmsErrorCodesString.join(", ") : "None" }
    }

	Text {
		text: "BMS"
		color: "blue"
		font.pixelSize: 24
	}
}
