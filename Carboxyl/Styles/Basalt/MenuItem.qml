// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Shapes
import QtQuick.Controls.impl 6.4
import QtQuick.Controls.Fusion 6.4
import QtQuick.Controls.Basic 6.4

import Carboxyl.Base

MenuItem {
    id: control

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 20

        color: control.down
               || control.highlighted ? control.palette.highlight : control.palette.window
    }

    indicator: Rectangle {
        x: control.mirrored ? control.width - width - control.rightPadding : control.leftPadding
        y: control.topPadding + (control.availableHeight - height) / 2

        implicitWidth: 20
        implicitHeight: 20

        visible: control.checkable

        color: "transparent"
        border {
            width: 1
            color: control.palette.dark
        }

        ColorImage {
            anchors.centerIn: parent
            visible: control.checked
            source: control.checkable ? "qrc:/qt-project.org/imports/QtQuick/Controls/Basic/images/check.png" : ""
            color: control.palette.windowText
            defaultColor: "#353637"
        }
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
}
