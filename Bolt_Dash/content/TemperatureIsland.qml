import QtQuick

Item {
	width: 200
	height: 250

	property int packTemp: 0
	property int mcTemp: 0
	property int motorTemp: 0
	readonly property int padding: 10
	readonly property int horizSpacing: 35
	readonly property int sliderWidth: 30


	Rectangle {
		x: 0
		y: 0
		radius: 15
		width: parent.width
		height: parent.height
		color: "white"

		FullSlider {
			id: packSlider
			x: 5
			label: "PACK"
			fullness: packTemp / 70
			value: packTemp
			imageUrl: "Pictures/battery_temp.svg"
			imageWidth: 45
			imageHeight: 40
		}

		FullSlider {
			id: mcSlider
			x: packSlider.x + horizSpacing + sliderWidth
			label: "MC"
			fullness: mcTemp / 100
			value: mcTemp
			imageUrl: "Pictures/controller_temp.svg"
			imageWidth: 35
			imageHeight: 35
		}

		FullSlider {
			id: motorSlider
			x: mcSlider.x + horizSpacing + sliderWidth
			label: "MOTOR"
			fullness: motorTemp / 115
			value: motorTemp
			imageUrl: "Pictures/motor_temp.svg"
			imageWidth: 50
			imageHeight: 60
		}

		// Redline
		Rectangle {
			x: 15
			y: 13
			width: parent.width - 30
			height: 6
			color: "red"
		}
	}
}