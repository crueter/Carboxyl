// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Material 6.8
import QtQuick.Controls.Material.impl 6.8

import Carboxyl.Clover
import Carboxyl.Contour

RadioButton {
    id: control

    Material.foreground: palette.buttonText
    Material.background: palette.button
    Material.accent: Clover.theme.currentAccent
    Material.theme: Clover.theme === Clover.light ? Material.Light : Material.Dark

    spacing: 2
    padding: 2
    verticalPadding: padding + 4

    indicator: RadioIndicator {
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                          + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        control: control

        Ripple {
            control: control
            color: control.checked ? control.Material.highlightedRippleColor : control.Material.rippleColor
        }
    }
}
