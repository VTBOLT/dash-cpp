import QtQuick 2.15
import QtQuick.Shapes

Item {
	id: root
	readonly property int leftLineWidth: 100
	readonly property int rightLineWidth: 125

	Shape {
		id: leftLine
		ShapePath {
			id: leftLinePath
			strokeColor: "white"
			strokeWidth: 2
			fillColor: "transparent"
			startX: 0
			startY: 225
			PathLine { x: leftLinePath.startX + root.leftLineWidth; y: leftLinePath.startY }
		}
	}

	Text {
		id: leftText
		text: "mph"
		color: "white"
		font.italic: true
		font.pixelSize: 20
		x: leftLinePath.startX + leftLine.width + root.leftLineWidth + 10
		y: leftLinePath.startY - 15
	}

	Shape {
		id: rightLine
		ShapePath {
			id: rightLinePath
			strokeColor: "white"
			strokeWidth: 2
			fillColor: "transparent"
			startX: leftText.x + leftText.width + 10
			startY: 225
			PathLine { x: rightLinePath.startX + root.rightLineWidth; y: rightLinePath.startY }
			PathLine { x: rightLinePath.startX + root.rightLineWidth + 75; y: 85 }
			PathLine { x: 1000; y: 85 }
		}
	}

	Rectangle {
		x: rightLinePath.startX + root.rightLineWidth
		y: 120
		color: "black"
		radius: 10
		border.width: 2
		border.color: "white"
		width: 85
		height: 60

		Image {
			id: packTempLabel
			anchors.centerIn: parent
			source: "Pictures/Virginia_Tech_Hokies_logo.svg"
			width: 70
			height: 35
		}
	}
}
