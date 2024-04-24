import QtQuick
import QtQuick.Controls
import QtQuick.Shapes

Item {
	property int status: BikeStatus.Status.STANDBY
	
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
		width: 250
		height: 75
		radius: 15
		color: {
			switch(status) {
				case BikeStatus.Status.STANDBY:
					return "#212121"
				case BikeStatus.Status.ACCESSORY:
					return "#212121"
				case BikeStatus.Status.CHECKING:
					return "#212121"
				case BikeStatus.Status.FAULT:
					return "red"
				case BikeStatus.Status.READY:
					return "#212121"
				case BikeStatus.Status.DRIVE:
					return "green"
			}
		}

		Text {
			anchors.centerIn: parent
			text: {
				switch (status) {
					case BikeStatus.Status.STANDBY:
						return "STANDBY"
					case BikeStatus.Status.ACCESSORY:
						return "ACCESSORY"
					case BikeStatus.Status.CHECKING:
						return "CHECKING"
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
			bottomPadding: 10
			font.pixelSize: 55
		}
	}
}