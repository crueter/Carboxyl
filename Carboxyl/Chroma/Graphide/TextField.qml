// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion

import Carboxyl.Clover
import Carboxyl.Contour

TextField {
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
