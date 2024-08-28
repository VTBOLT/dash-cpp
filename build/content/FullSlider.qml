import QtQuick

Item {
	property string label: ""
	property string imageUrl: ""
	property color textColor: "white"
    property double fullness: 0.5
	property int value: 0
	property int imageWidth: 50
	property int imageHeight: 50
	readonly property int padding: 5
	readonly property int valueLabelTextSize: 30
	

	height: packTempSlider.height*packTempSlider.scale + packTempLabel.height + valueLabel.height
	width: packTempSlider.width*packTempSlider.scale + padding

	TempSlider {
		id: packTempSlider
		x: 0
		y: -(height*scale)/2 + padding
		scale: 0.5
		fullness: parent.fullness > 1 ? 1 : parent.fullness < 0 ? 0 : parent.fullness // Abosulte max of 100C and divide by 2 for avg
	}

	// current temp label
	Text {
		id: valueLabel
		x: packTempSlider.width
		y: height/2
		text: qsTr("%1").arg(value)
		font.bold: true
		font.pixelSize: valueLabelTextSize
		color: textColor
	}

	Text {
		id: unitLabel
		x: valueLabel.x
		y: valueLabel.y + valueLabel.height
		text: qsTr("°C")
		font.bold: true
		color: textColor
		font.pixelSize: 20
	
	}

	Image {
		id: packTempLabel
		x: packTempSlider.x - width/2 + packTempSlider.width/2
		y: packTempSlider.height*packTempSlider.scale - height - padding
		source: imageUrl
		width: imageWidth
		height: imageHeight
	}
}