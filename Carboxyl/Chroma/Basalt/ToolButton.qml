// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.4
import QtQuick.Shapes

import Carboxyl.Clover
import Carboxyl.Contour

ToolButton {
    id: control

    background: Rectangle {
        implicitWidth: 40
        implicitHeight: 30

        opacity: control.down ? 1.0 : control.hovered ? 0.75 : 0.5
        color: control.down || control.checked
               || control.highlighted ? control.palette.mid : control.palette.button

        Behavior on color {
            ColorAnimation {
                duration: 150
            }
        }
    }
}
