// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Universal 6.4
import QtQuick.Controls.impl 6.4

import Carboxyl.Clover
import Carboxyl.Contour

MenuItem {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: Clover.theme.currentAccent
    Universal.theme: Clover.theme === Clover.light ? Universal.Light : Universal.Dark

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
            color: !control.enabled ? control.Universal.baseLowColor : control.Universal.baseHighColor

            anchors {
                left: parent.left
                leftMargin: 5
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

            color: !control.enabled ? control.Universal.baseLowColor : control.Universal.baseHighColor
            font: control.font
        }
    }

    indicator: Rectangle {
        color: "transparent"
        border {
            width: 1
            color: Clover.theme.text
        }

        visible: control.checkable

        width: img.width + 5
        height: img.height + 5

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                          + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        ColorImage {
            id: img
            anchors.centerIn: parent

            visible: control.checked
            color: !control.enabled ? control.Universal.baseLowColor : control.down ? control.Universal.baseHighColor : control.Universal.baseMediumHighColor
            source: !control.checkable ? "" : "qrc:/qt-project.org/imports/QtQuick/Controls/Universal/images/checkmark.png"

            height: 20
        }
    }
}
