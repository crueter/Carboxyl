// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.4
import QtQuick.Shapes

import Carboxyl.Clover
import Carboxyl.Contour

ProgressBar {
    id: control

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 24

        radius: 2
        color: control.palette.button
        border.color: Fusion.outline(control.palette)

        Rectangle {
            x: 1
            y: 1
            height: 1
            width: parent.width - 2
            color: Fusion.topShadow
        }
    }
}
