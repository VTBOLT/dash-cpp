import QtQuick
import Bolt_Dash

Item {
	property int soc
	readonly property int textLabelY: 260
	readonly property int valueLabelY: textLabelY+25


	BatterySlider {
		id: packSlider
		x: 0
		y: 0
		scale: 0.5
		fullness: soc     // Percent to decimal
	}

	// Max battery percentages
	Text {
		x: packSlider.x + packSlider.width/2 - width/2
		y: valueLabelY
		horizontalAlignment: Text.AignHCenter
		text: qsTr("%1\%").arg(soc)
		color: Constants.textColor
		font.pixelSize: valueLabelTextSize
	}

	Text {
		id: packLabel
		horizontalAlignment: Text.AlignHCenter
		x: packSlider.x + packSlider.width/2 - width/2
		y: textLabelY
		text: qsTr("PACK")
		color: Constants.textColor
		font.pixelSize: labelTextSize
	}
}