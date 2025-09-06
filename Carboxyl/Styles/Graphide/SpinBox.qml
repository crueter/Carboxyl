// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.FluentWinUI3

import Carboxyl.Base

// TODO(crueter): Reimplement
SpinBox {
    id: control

    palette {
        buttonText: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
        base: Palettes.theme.buttonLight
        accent: Palettes.accent.main
    }
}
