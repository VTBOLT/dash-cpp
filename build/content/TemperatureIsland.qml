import QtQuick

Item {
	width: 500
	height: 250

	property int packTemp: 0
	property int mcTemp: 0
	property int motorTemp: 0
	readonly property int padding: 10
	readonly property int horizSpacing: 35
	readonly property int sliderWidth: 55


	Rectangle {
		x: 0
		y: 0
		radius: 0
		width: parent.width
		height: parent.height
		color: "transparent"
		border.width: 2
		border.color: "white"

		FullSlider {
			id: packSlider
			x: 3*padding
			y: 15
			label: "PACK"
			fullness: packTemp / 70
			value: packTemp
			imageUrl: "Pictures/battery_temp.svg"
			imageWidth: 35
			imageHeight: 30
		}

		FullSlider {
			id: mcSlider
			x: packSlider.x + horizSpacing + sliderWidth
			y: packSlider.y
			label: "MC"
			fullness: mcTemp / 100
			value: mcTemp
			imageUrl: "Pictures/controller_temp.svg"
			imageWidth: 30
			imageHeight: 30
		}

		FullSlider {
			id: motorSlider
			x: mcSlider.x + horizSpacing + sliderWidth
			y: packSlider.y
			label: "MOTOR"
			fullness: motorTemp / 115
			value: motorTemp
			imageUrl: "Pictures/motor_temp.svg"
			imageWidth: 30
			imageHeight: 25
		}

		// Redline
		// Rectangle {
		// 	x: 25
		// 	y: 13
		// 	width: 200
		// 	height: 3
		// 	color: "red"
		// }
	}
}