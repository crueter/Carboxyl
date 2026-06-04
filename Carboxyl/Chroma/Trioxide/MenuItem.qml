// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.8
import QtQuick.Shapes
import QtQuick.Controls.impl 6.8

import Carboxyl.Clover
import Carboxyl.Contour
import Carboxyl.Chroma.Trioxide as T

MenuItem {
    id: control

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
            color: control.down
                   || control.highlighted ? Fusion.highlightedText(
                                                control.palette) : control.palette.text
            anchors {
                left: parent.left
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

            color: control.down
                   || control.highlighted ? Fusion.highlightedText(
                                                control.palette) : control.palette.text
            font: control.font
        }
    }

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
