// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2
import Bolt_Dash
import Backend
import IO

Window {
    width: mainScreen.width
    height: mainScreen.height
    property bool debugMode: true
    

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
}

