// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.8
import QtQuick.Shapes

import Carboxyl.Clover
import Carboxyl.Contour

MenuSeparator {
    id: control

    background: Rectangle {
        color: control.palette.window
    }

    contentItem: Rectangle {
        implicitWidth: 188
        implicitHeight: 1
        color: control.palette.text
    }
}
