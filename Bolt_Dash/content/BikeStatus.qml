import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import QtQuick.Layouts

Item {
	readonly property color staticBG: "#5F5F5F"
    readonly property string green: "#54c45e"
	property list<string> texts: ["STDBY", "ACC", "PREP", "IDLE", "DRIVE"]
	property int status: BikeStatus.Status.STANDBY
	
	width: 800
	height: 40
	id: root

	enum Status {
		STANDBY,
		ACCESSORY,
		CHECKING,
		READY,
		DRIVE,
		FAULT
	}

	Rectangle {
		visible: false
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
			font.pixelSize: 0.75*parent.height
		}
	}

	Rectangle {
		height: parent.height
		width: parent.width
		color: "white"
		
		GridLayout {
			id: grid 
			columns: 5
			x: 0
			y: columnSpacing
			height: parent.height
			width: parent.width
			columnSpacing: 2

			Repeater {
				model: 5
				Rectangle {
					required property int index
					color: root.status == index ? (root.status == BikeStatus.Status.DRIVE ? root.green : "red") : "black"
					Layout.preferredWidth: parent.width / parent.columns - parent.columnSpacing
					height: parent.height
					Text {
						anchors.centerIn: parent
						text: root.texts[index]
						color: root.status == index ? "black": "white"
						font.bold: true
						font.pixelSize: 25
					}
				}
			}
		}
	}
}