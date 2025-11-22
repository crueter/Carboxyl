// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls.impl

import Carboxyl.Clover
import Carboxyl.Contour
import Carboxyl.Chroma.Graphide as G

MenuItem {
    id: control

    padding: 8
    spacing: 6

    indicator: G.CheckBox {
        x: control.mirrored ? control.width - width - control.rightPadding : control.leftPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        implicitWidth: 20
        implicitHeight: 20

        visible: control.checkable
        checked: control.checked
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 30
        x: 1
        y: 1
        width: control.width - 2
        height: control.height - 2
        color: control.down ? control.palette.midlight : control.highlighted ? control.palette.light : "transparent"
        radius: width / 20
    }

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
                   || control.highlighted ? control.palette.highlightedText : control.palette.text
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
                   || control.highlighted ? control.palette.highlightedText : control.palette.text
            font: control.font
        }
    }
}
