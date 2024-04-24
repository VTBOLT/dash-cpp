import QtQuick

Item {
	property string label: ""
	property string imageUrl: ""
    property double fullness: 0.5
	property int value: 0
	property int imageWidth: 50
	property int imageHeight: 50

	height: packTempSlider.height*packTempSlider.scale + packTempLabel.height + valueLabel.height + padding*2
	width: packTempSlider.width*packTempSlider.scale + padding*2


	TempSlider {
		id: packTempSlider
		x: 0
		y: -(height*scale)/2 + padding
		scale: 0.5
		fullness: parent.fullness > 1 ? 1 : parent.fullness < 0 ? 0 : parent.fullness // Abosulte max of 100C and divide by 2 for avg
	}

	// Text {
	// 	id: packTempLabel
	// 	x: packTempSlider.x - width/2 + packTempSlider.width/2
	// 	y: packTempSlider.height*packTempSlider.scale + height/4
	// 	text: label
	// 	font.pixelSize: labelTextSize
	// 	font.bold: true
	// 	horizontalAlignment: Text.AlignHCenter
	// }

	// Pack max temp label
	Text {
		id: valueLabel
		x: packTempSlider.x - width/2 + packTempSlider.width/2
		y: packTempSlider.height*packTempSlider.scale + height/4
		text: qsTr("%1°C").arg(value)
		font.bold: true
		font.pixelSize: valueLabelTextSize
	}

	Image {
		id: packTempLabel
		x: packTempSlider.x - width/2 + packTempSlider.width/2
		y: (250 - (valueLabel.y + valueLabel.height)) / 2 + (valueLabel.y + valueLabel.height) - height/2
		source: imageUrl
		width: imageWidth
		height: imageHeight
	}
}