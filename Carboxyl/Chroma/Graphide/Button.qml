// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.8
import QtQuick.Controls.impl
import QtQuick.Shapes

import Carboxyl.Clover
import Carboxyl.Contour

Button {
    id: control

    function getColor(color, intensity) {
        if (Clover.isDarkMode)
            return Qt.lighter(color, intensity)

        return Qt.darker(color, intensity)
    }

    background: Rectangle {
        implicitWidth: 75
        implicitHeight: 35
        visible: !control.flat || control.down || control.checked
                 || control.highlighted
        color: getColor(
                   control.palette.button,
                   control.down ? 1.4 : (control.hovered || control.checked
                                         || control.highlighted ? 1.2 : 1.0))

        Behavior on color {
            ColorAnimation {
                duration: 150
            }
        }

        border.color: Clover.theme.currentAccent
        border.width: control.visualFocus ? 2 : 0

        radius: 6
    }
}
