// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Shapes

import Carboxyl.Base

MenuSeparator {
    palette {
        buttonText: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
    }

    id: control

    contentItem: Rectangle {
        implicitWidth: 188
        implicitHeight: 1
        color: palette.buttonText
    }
}
