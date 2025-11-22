// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.4
import QtQuick.Controls.impl 6.4

import Carboxyl.Clover
import Carboxyl.Contour

TextField {
    id: control

    property bool borderless: false

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 24

        radius: 2
        color: control.palette.button
        border {
            color: control.activeFocus ? palette.accent : Fusion.outline(
                                             control.palette)
            width: !borderless + control.activeFocus

            Behavior on color {
                ColorAnimation {
                    duration: 150
                }
            }
        }

        Rectangle {
            x: 1
            y: 1
            width: parent.width - 2
            height: parent.height - 2
            color: "transparent"
            border.color: Color.transparent(Fusion.highlightedOutline(
                                                control.palette), 40 / 255)
            visible: !borderless && control.activeFocus
            radius: 1.7
        }

        Rectangle {
            visible: !borderless
            x: 2
            y: 1
            width: parent.width - 4
            height: 1
            color: Fusion.topShadow
        }
    }
}
