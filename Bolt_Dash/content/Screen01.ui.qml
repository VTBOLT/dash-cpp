
/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick 6.2
import QtQuick.Controls 6.2
import Bolt_Dash

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
	readonly property int bikeStatusX: 0
	readonly property int verticalSpacing: 10
	readonly property int temperatureIslandY: 290

	Speedometer {
		id: speedometer
		fullness: backend.motorSpeed / 6000 // Expected max speed of 5500 RPM
		x: 50
		y: 25
	}

	SpeedometerDecorations {
		x: speedometer.x
		y: speedometer.y
	}

	BatteryReadout {
		id: batteryReadout
		x: 0
		y: 300
		// soc: 50
		// voltage: 541.2
		soc: backend.packSOC * 100
		voltage: backend.packVoltage
	}

	TemperatureIsland {
		id: temps 
		x: 500
		y: temperatureIslandY
		packTemp: backend.highCellTemp
		mcTemp: backend.mcTemp
		motorTemp: backend.motorTemp
		// packTemp: 0.89*70
		// mcTemp: 91
		// motorTemp: 0.9*115
	}
	Text {
		id: speedoLabel
		x: mphLabelX
		y: speedometer.y + speedometer.height/2 + 7 +verticalSpacing
		text: qsTr("%1").arg(Math.round(backend.bikeSpeed))
		color: Constants.textColor
		font.pixelSize: mphLabelTextSize // For showing speed in mph
		horizontalAlignment: Text.AlignHLeft
	}

	// :(
	// BoltLeanAngle {
	// 	id: leanAngle
	// 	ang: 39
	// 	x: ((Constants.width - width*scale/1.5) / 2)
	// 	y: (Constants.height - height/2*scale) / 2
	// 	scale: 0.6
	// }

	BikeStatus {
		id: bikeStatus
		x: bikeStatusX
		y: Constants.height - height
		status: backend.bikeStatus
	}

	FaultMotorStatus {
		x: Constants.width - width
		y: speedometer.y + speedometer.height + 40
		motorOn: backend.motorOn
		mcFault: backend.mcFault
		bmsFault: backend.bmsFault
	}
}
