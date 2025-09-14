// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Shapes

import Carboxyl.Base
import Carboxyl.Styles.Trioxide as T

MenuItem {
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

    id: control
    onCheckedChanged: console.log(checked)

    indicator: T.CheckIndicator {
        x: control.mirrored ? control.width - width - control.rightPadding : control.leftPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        control: control
        visible: control.checkable
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 20

        color: control.down
               || control.highlighted ? control.palette.highlight : control.palette.button
    }
}
