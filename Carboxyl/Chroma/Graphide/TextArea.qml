// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion

import Carboxyl.Clover
import Carboxyl.Contour

TextArea {
    id: control

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 30

        radius: 10

        color: control.palette.base
    }

    AccentedFooter {
        control: control
    }
}
