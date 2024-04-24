import QtQuick
import Bolt_Dash

Item {
	readonly property int batteryBorder: 5
    readonly property string red: "#e80c0c"
    readonly property string green: "#09bd0f"
	property int soc
	
	Rectangle {
		radius: 15
		width: 175
		height: 125
		color: "black"

		Image {
			x: parent.width/2 - width/2
			y: 15
			source: "Pictures/battery.svg"
			sourceSize.width: 150
			sourceSize.height: 75

			Rectangle {
				x: batteryBorder
				y: batteryBorder
				color: "transparent"
				width: 150 - batteryBorder * 2 - 16
				height: 75 - batteryBorder * 2

				Rectangle {
					radius: 8
					width: parent.width
					height: parent.height
					color: "black"
				}

				Rectangle {
					radius: 8
					width: soc/100 * parent.width
					height: parent.height
					color: soc < 20 ? red : green
				}
			}
    	}

		Text {
			x: parent.width/2 - width/2
			y: parent.height - height/2 - 20
			horizontalAlignment: Text.AignHCenter
			color: "white"
			text: qsTr("%1\%").arg(soc)
			font.pixelSize: 25
		}
	}
	
}