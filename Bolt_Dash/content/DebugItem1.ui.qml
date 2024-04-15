import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Bolt_Dash

Item {
    width: Constants.width
    height: Constants.height

    // Properties, all defined as doubles
    property double motorTemp: 0.0
    property double auxVoltage: 0.0
    property double auxPercent: 0.0
    property double packSOC: 0.0
    property double highCellTemp: 0.0
    property double lowCellTemp: 0.0
    property double bmsTemp: 0.0
    property double motorSpeed: 0.0
    property double bikeSpeed: 0.0

    // Using grid layout for organized display
    GridLayout {
        columns: 2
        columnSpacing: 20
        rowSpacing: 10
        width: parent.width
        height: parent.height

        // Labels and dynamic text for each data item, converting double to string for display
        Label { text: "Motor Temperature:" }
        Text { text: motorTemp.toString() }

        Label { text: "Aux Voltage:" }
        Text { text: auxVoltage.toString() }

        Label { text: "Aux Percent:" }
        Text { text: auxPercent.toString() }

        Label { text: "Pack State of Charge (SOC):" }
        Text { text: packSOC.toString() }

        Label { text: "High Cell Temperature:" }
        Text { text: highCellTemp.toString() }

        Label { text: "Low Cell Temperature:" }
        Text { text: lowCellTemp.toString() }

        Label { text: "BMS Temperature:" }
        Text { text: bmsTemp.toString() }

        Label { text: "Motor Speed:" }
        Text { text: motorSpeed.toString() }

        Label { text: "Bike Speed:" }
        Text { text: bikeSpeed.toString() }
    }
}
