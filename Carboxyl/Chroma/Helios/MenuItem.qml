// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Material 6.8
import QtQuick.Controls.impl 6.8

import Carboxyl.Clover
import Carboxyl.Contour

MenuItem {
    id: control

    Material.foreground: palette.buttonText
    Material.background: palette.button
    Material.accent: Clover.theme.currentAccent
    Material.theme: Clover.theme === Clover.light ? Material.Light : Material.Dark

    verticalPadding: 0
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

            color: palette.buttonText
            font: control.font
        }
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 36
        color: control.highlighted ? control.Material.listHighlightColor : "transparent"

        Behavior on color {
            ColorAnimation {
                easing.type: Easing.InOutQuad
                duration: 150
            }
        }
    }
}
