// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls.Fusion

import Carboxyl.Base

Slider {
    palette {
        buttonText: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: enabled ? Palettes.theme.disabledText : Palettes.theme.buttonLight
        highlight: Palettes.accent.main
    }

    id: control
}
