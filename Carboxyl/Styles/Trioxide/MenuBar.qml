// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Shapes

import Carboxyl.Base
import Carboxyl.Styles.Trioxide as T

MenuBar {
    palette {
        text: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        window: Palettes.theme.buttonLight
    }

    id: control

    delegate: T.MenuBarItem {}
}
