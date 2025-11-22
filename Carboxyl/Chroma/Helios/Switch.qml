// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import Carboxyl.Clover
import Carboxyl.Contour

import QtQuick
import QtQuick.Controls.Material 6.4
import QtQuick.Controls.Material.impl
import QtQuick.Controls.impl 6.4

Switch {
    id: control

    Material.foreground: palette.buttonText
    Material.background: palette.button
    Material.accent: palette.accent
    Material.theme: Palettes.theme === Palettes.light ? Material.Light : Material.Dark

    // implicitWidth: 20
    // implicitHeight: 20
    padding: 2
    spacing: 2

    indicator: SwitchIndicator {
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                          + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        control: control

        width: 40
        height: 25

        handle.width: 20
        handle.height: 20

        Ripple {
            x: parent.handle.x + parent.handle.width / 2 - width / 2
            y: parent.handle.y + parent.handle.height / 2 - height / 2
            width: 14
            height: 14
            pressed: control.pressed
            active: enabled && (control.down || control.visualFocus
                                || control.hovered)
            color: control.checked ? control.Material.highlightedRippleColor : control.Material.rippleColor
        }
    }
}
