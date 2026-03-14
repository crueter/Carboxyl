// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Material 6.4
import QtQuick.Controls.Material.impl as M

import Carboxyl.Clover
import Carboxyl.Contour

CheckBox {
    id: control

    Material.foreground: palette.buttonText
    Material.background: palette.button
    Material.accent: Clover.theme.currentAccent
    Material.theme: Clover.theme === Clover.light ? Material.Light : Material.Dark

    indicator: M.CheckIndicator {
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                          + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        control: control

        border.color: !control.enabled ? control.Material.hintTextColor : checkState
                                         !== Qt.Unchecked ? control.Material.accentColor : control.palette.button

        M.Ripple {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 28
            height: 28

            z: -1
            anchor: control
            pressed: control.pressed
            active: enabled && (control.down || control.visualFocus
                                || control.hovered)
            color: control.checked ? control.Material.highlightedRippleColor : control.Material.rippleColor
        }
    }
}
