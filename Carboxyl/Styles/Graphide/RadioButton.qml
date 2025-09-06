// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls.FluentWinUI3
import QtQuick.Controls.impl

import Carboxyl.Base

// TODO(crueter): This sucks
RadioButton {
    id: control

    palette {
        text: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        window: Palettes.theme.background
        base: Palettes.theme.background
        accent: Palettes.accent.main
    }
}
