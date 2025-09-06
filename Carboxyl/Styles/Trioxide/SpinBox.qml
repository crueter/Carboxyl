// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Shapes

import Carboxyl.Base

SpinBox {
    palette {
        text: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        buttonText: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.button
        base: Palettes.theme.buttonLight
    }

    id: control
}
