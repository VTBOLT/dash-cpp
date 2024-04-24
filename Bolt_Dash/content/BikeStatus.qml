import QtQuick
import QtQuick.Controls
import QtQuick.Shapes

Item {
	readonly property color staticBG: "#5F5F5F"
    readonly property string green: "#09bd0f"
	property int status: BikeStatus.Status.STANDBY
	
	width: 350
	height: 90

	enum Status {
		STANDBY,
		ACCESSORY,
		CHECKING,
		FAULT,
		READY,
		DRIVE
	}

	Rectangle {
		id: rect
		anchors.centerIn: parent
		width: parent.width
		height: parent.height
		radius: 15
		color: {
			switch(status) {
				case BikeStatus.Status.STANDBY:
				case BikeStatus.Status.ACCESSORY:
				case BikeStatus.Status.CHECKING:
				case BikeStatus.Status.READY:
					return staticBG
				case BikeStatus.Status.FAULT:
					return "red"
				case BikeStatus.Status.DRIVE:
					return green
			}
		}

		Text {
			anchors.centerIn: parent
			text: {
				switch (status) {
					case BikeStatus.Status.STANDBY:
						return "STANDBY"
					case BikeStatus.Status.ACCESSORY:
						return "ACC"
					case BikeStatus.Status.CHECKING:
						return "WAITING"
					case BikeStatus.Status.FAULT:
						return "FAULT"
					case BikeStatus.Status.READY:
						return "READY"
					case BikeStatus.Status.DRIVE:
						return "DRIVE"
				}
			}
			color: "white"
			font.bold: true
			font.pixelSize: 0.8*parent.height
		}
	}
}