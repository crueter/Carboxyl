// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls.Universal

import Carboxyl.Base

ToolButton {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: palette.accent
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark

    background: Rectangle {
        implicitWidth: 56
        implicitHeight: 30

        color: control.enabled
               && (control.highlighted
                   || control.checked) ? control.Universal.accent : "transparent"

        Rectangle {
            width: parent.width
            height: parent.height
            visible: enabled && (control.down || control.hovered)
            color: control.down ? control.Universal.listMediumColor : control.Universal.listLowColor
        }
    }
}
