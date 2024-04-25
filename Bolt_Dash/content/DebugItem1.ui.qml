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
        columnSpacing: 10
        rowSpacing: 10
        width: parent.width
        height: parent.height

        // Labels and dynamic text for each data item, converting double to string for display
        Text { text: "Motor Temperature:" }
        Text { text: qsTr("%1°C").arg(backend.motorTemp) }

        Text { text: "Aux Voltage:" }
        Text { text: qsTr("%1V").arg(auxVoltage) }

        Text { text: "Aux Percent:" }
        Text { text: qsTr("%1\%").arg(auxPercent*100) }

        Text { text: "Pack State of Charge (SOC):" }
        Text { text: qsTr("%1\%").arg(packSOC*100) }

        Text { text: "High Cell Temperature:" }
        Text { text: qsTr("%1°C").arg(highCellTemp) }

        Text { text: "Low Cell Temperature:" }
        Text { text: qsTr("%1°C").arg(lowCellTemp) }

        Text { text: "BMS Temperature:" }
        Text { text: qsTr("%1°C").arg(bmsTemp) }

        Text { text: "Motor Speed:" }
        Text { text: qsTr("%1 RPM").arg(motorSpeed) }

        Text { text: "Bike Speed:" }
        Text { text: qsTr("%1 mph").arg(bikeSpeed) }
    }
}
