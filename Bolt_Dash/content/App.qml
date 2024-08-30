// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import Bolt_Dash
import IO

Window {
    width: mainScreen.width
    height: mainScreen.height
    property bool debugMode: false
    

    visible: true
    title: "Bolt_Dash"

   Screen01 {
       id: mainScreen
       visible: !debugMode
   }

    Debug1 {
        id: debug
        visible: debugMode
    }

    IO {
        id: io

        onButtonTapped: {
            debugMode = !debugMode
        }
    }

    Rectangle {
        visible: true
        color: "transparent"
        border.color: "red"
        border.width: 1
        height: Constants.height
        width: Constants.width
    }
}

