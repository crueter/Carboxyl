// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.8
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
            duration: 100
        }
    }

    exit: Transition {
        NumberAnimation {
            property: "height"
            from: control.implicitHeight
            to: 0
            easing.type: Easing.OutCubic
            duration: 100
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
