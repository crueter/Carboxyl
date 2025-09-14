// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.FluentWinUI3

import Carboxyl.Base
import Carboxyl.Styles.Graphide as G

MenuItem {
    id: control

    palette {
        text: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        windowText: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        buttonText: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
        base: Palettes.theme.button
        window: Palettes.theme.button
        highlight: Palettes.theme.buttonLight
        highlightedText: Palettes.theme.buttonText
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 30
        radius: 8

        color: control.down
               || control.highlighted ? palette.highlight : palette.button
    }
}
