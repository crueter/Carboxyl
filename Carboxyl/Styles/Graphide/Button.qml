// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.4
import QtQuick.Controls.impl
import QtQuick.Shapes

import Carboxyl.Base

Button {
    id: control

    background: Rectangle {
        implicitWidth: 75
        implicitHeight: 35
        visible: !control.flat || control.down || control.checked
                 || control.highlighted
        color: Color.blend(
                   control.checked
                   || control.highlighted ? control.palette.dark : control.palette.button,
                   control.palette.mid, control.down ? 0.5 : 0.0)
        border.color: control.palette.highlight
        border.width: control.visualFocus ? 2 : 0

        radius: 6
    }
}
