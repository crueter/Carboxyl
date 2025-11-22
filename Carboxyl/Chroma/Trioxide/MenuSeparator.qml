// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.4
import QtQuick.Shapes

import Carboxyl.Clover
import Carboxyl.Contour

MenuSeparator {
    palette {
        buttonText: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.button
    }

    id: control

    contentItem: Rectangle {
        implicitWidth: 188
        implicitHeight: 1
        color: palette.buttonText
    }
}
