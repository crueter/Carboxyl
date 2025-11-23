// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.4
import QtQuick.Shapes

import Carboxyl.Clover
import Carboxyl.Contour
import Carboxyl.Chroma.Graphide as T

Menu {
    palette {
        window: Clover.theme.midlight
    }

    id: control
    delegate: T.MenuItem {}

    enter: Transition {
        NumberAnimation {
            property: "height"
            from: control.implicitHeight * 0.33
            to: control.implicitHeight
            easing.type: Easing.OutCubic
            duration: 250
        }
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        color: control.palette.alternateBase
        border.color: control.palette.dark

        radius: width / 20
    }
}
