
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import Bolt_Dash
import Backend

Rectangle {
	id: rectangle
	width: Constants.width
	height: Constants.height

	color: backend.bmsFault ? Constants.errColor : Constants.backgroundColor

	readonly property int sliderY: 160
	readonly property int textLabelY: sliderY + 260
	readonly property int valueLabelY: textLabelY+25
	readonly property int labelTextSize: 25
	readonly property int valueLabelTextSize: 20
	readonly property int mphLabelTextSize: 150
	readonly property int mphLabelX: 50
	readonly property int mphLabelY: 80
	readonly property int bikeStatusX: 400
	readonly property int verticalSpacing: 10

	Speedometer {
		id: speedometer
		fullness: backend.motorSpeed / 5500 // Expected max speed of 5500 RPM
		x: 50
		y: 25
	}

	Backend {
		id: backend
		motorTemp: 0
		auxVoltage: 0
		auxPercent: 0
		packSOC: 0
		highCellTemp: 0
		lowCellTemp: 0
		bmsTemp: 0
		motorSpeed: 0
		bikeSpeed: 125
	}

	BatteryReadout {
		id: batteryReadout
		x: 50
		y: 300
		soc: 50
		// soc: backend.packSOC
	}

	TemperatureIsland {
		id: temps 
		x: 550
		y: bikeStatus.y + bikeStatus.height + verticalSpacing
		// packTemp: backend.highCellTemp
		// mcTemp: backend.mcTemp
		// motorTemp: backend.motorTemp
		packTemp: -10
		mcTemp: 69
		motorTemp: 0.9*115
	}
	Text {
		id: speedoLabel
		x: mphLabelX
		y: speedometer.y + speedometer.height/2 + 7 +verticalSpacing
		text: "125"
		// text: qsTr("%1").arg(Math.round(backend.bikeSpeed))
		color: Constants.textColor
		font.pixelSize: mphLabelTextSize // For showing speed in mph
		horizontalAlignment: Text.AlignHLeft
		font.family: "Nasalization"
	}

	BoltLeanAngle {
		id: leanAngle
		ang: 39
		x: Constants.width / 2
		y: Constants.height / 2
	}

	BikeStatus {
		id: bikeStatus
		x: bikeStatusX
		y: speedometer.y + speedometer.height + verticalSpacing
		status: BikeStatus.Status.CHECKING
	}
}
