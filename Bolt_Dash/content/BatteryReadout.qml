import QtQuick
import QtQuick.Shapes

Item {
	readonly property int batteryBorder: 5
    readonly property string red: "#e80c0c"
    readonly property string green: "#09bd0f"
	property int soc
	property double voltage
	
	Rectangle {
		radius: 15
		width: 175
		height: 125
		color: "black"

		Image {
			x: 15
			y: 15
			id: batterySVG
			source: "Pictures/battery.svg"
			sourceSize.width: 150
			sourceSize.height: 75
			rotation: 270
			transformOrigin: Item.Center

			Rectangle {
				x: batteryBorder
				y: batteryBorder
				color: "transparent"
				width: parent.sourceSize.width - batteryBorder * 2 - 16
				height: parent.sourceSize.height - batteryBorder * 2

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
			id: percentLabel
			x: batterySVG.x + batterySVG.width - 37
			y: parent.height/2 - 2*height/3
			horizontalAlignment: Text.AlignHLeft
			verticalAlignment: Text.AlignBottom
			color: "white"
			text: qsTr("%1\%").arg(soc)
			font.pixelSize: 60
		}

		Shape {
			ShapePath {
				id: coolLine
				strokeColor: "white"
				strokeWidth: 4
				fillColor: "transparent"
				// strokeStyle: ShapePath.DashLine
				dashPattern: [ 1, 4 ]
				startX: percentLabel.x
				startY: percentLabel.y+percentLabel.height - 10
				PathLine { x: coolLine.startX + 140; y: coolLine.startY }
			}
		}

		// Voltage Text
		Text {
			id: voltageText
			x: percentLabel.x + batteryBorder
			y: batterySVG.y + batterySVG.height - height/2 + batteryBorder
			text: qsTr("%1V").arg(voltage)
			color: "white"
			font.pixelSize: 20
			font.italic: true
		}
	}
	
}
