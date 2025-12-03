// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Universal 6.4

import Carboxyl.Clover
import Carboxyl.Contour

ToolButton {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: Clover.theme.currentAccent
    Universal.theme: Clover.theme === Clover.light ? Universal.Light : Universal.Dark

    background: Rectangle {
        implicitWidth: 56
        implicitHeight: 30

        radius: 6

        color: control.enabled
               && (control.highlighted
                   || control.checked) ? control.Universal.accent : "transparent"

        Rectangle {
            width: parent.width
            height: parent.height
            visible: enabled && (control.down || control.hovered)
            color: control.down ? control.Universal.listMediumColor : control.Universal.listLowColor

            radius: 6
            Behavior on color {
                ColorAnimation {
                    duration: 150
                }
            }
        }
    }
}
