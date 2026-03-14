// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Material 6.4
import QtQuick.Controls.Material.impl
import QtQuick.Controls.impl

import Carboxyl.Clover
import Carboxyl.Contour

SpinBox {
    id: control

    Material.foreground: palette.buttonText
    Material.background: palette.button
    Material.accent: Clover.theme.currentAccent
    Material.theme: Clover.theme === Clover.light ? Material.Light : Material.Dark

    verticalPadding: 5

    up.indicator: PaddedRectangle {
        x: control.mirrored ? 0 : control.width - width
        implicitWidth: 40
        implicitHeight: 40
        height: control.height
        width: height
        color: up.hovered ? Material.rippleColor : "transparent"
        padding: 5

        Behavior on color {
            ColorAnimation {
                easing.type: Easing.InOutQuad
                duration: 150
            }
        }

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: Math.min(parent.width / 3, parent.height / 3)
            height: 2
            color: enabled ? control.Material.foreground : control.Material.spinBoxDisabledIconColor
        }
        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 2
            height: Math.min(parent.width / 3, parent.height / 3)
            color: enabled ? control.Material.foreground : control.Material.spinBoxDisabledIconColor
        }
    }

    down.indicator: PaddedRectangle {
        x: control.mirrored ? control.width - width : 0
        implicitWidth: 40
        implicitHeight: 40
        height: control.height
        width: height
        color: down.hovered ? Material.rippleColor : "transparent"
        padding: 5

        Behavior on color {
            ColorAnimation {
                easing.type: Easing.InOutQuad
                duration: 150
            }
        }

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width / 3
            height: 2
            color: enabled ? control.Material.foreground : control.Material.spinBoxDisabledIconColor
        }
    }

    background: MaterialTextContainer {
        implicitWidth: 140
        implicitHeight: 40

        outlineColor: control.palette.button
        focusedOutlineColor: control.Material.accentColor
        controlHasActiveFocus: control.activeFocus
        controlHasText: true
        horizontalPadding: control.Material.textFieldHorizontalPadding
    }
}
