// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.impl

import Carboxyl.Base

MenuItem {
    id: control

    Material.foreground: Palettes.theme.buttonText
    Material.background: Palettes.theme.buttonLight
    Material.accent: Palettes.accent.main
    Material.theme: Palettes.theme === Palettes.light ? Material.Light : Material.Dark

    verticalPadding: 5
    spacing: 5

    contentItem: Item {
        IconLabel {
            readonly property real arrowPadding: control.subMenu
                                                 && control.arrow ? control.arrow.width
                                                                    + control.spacing : 0
            readonly property real indicatorPadding: control.checkable
                                                     && control.indicator ? control.indicator.width + control.spacing : 0
            leftPadding: !control.mirrored ? indicatorPadding : arrowPadding
            rightPadding: control.mirrored ? indicatorPadding : arrowPadding

            spacing: control.spacing
            mirrored: control.mirrored
            display: control.display
            alignment: Qt.AlignLeft

            icon: control.icon
            text: control.text
            font: control.font
            color: control.enabled ? control.Material.foreground : control.Material.hintTextColor
            anchors {
                left: parent.left
                leftMargin: 5 + (control.checkable ? control.indicator.width : 0)
                verticalCenter: parent.verticalCenter
            }
        }

        Text {
            anchors {
                right: parent.right
                rightMargin: 5
                verticalCenter: parent.verticalCenter
            }

            Component.onCompleted: if (control.action != null
                                           && typeof control.action.shortcut !== 'undefined')
                                       text = control.action.shortcut

            color: !control.enabled ? Palettes.theme.disabledText : Palettes.theme.buttonText
            font: control.font
        }
    }
}
