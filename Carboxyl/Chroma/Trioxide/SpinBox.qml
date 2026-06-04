// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.8
import QtQuick.Shapes
import QtQuick.Controls.impl 6.8

import Carboxyl.Clover
import Carboxyl.Contour
import Carboxyl.Chroma.Trioxide as T

SpinBox {
    id: control

    palette {
        base: Clover.theme.button
    }

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 26

        radius: 2
        color: control.palette.button
        border {
            color: control.activeFocus ? Clover.theme.currentAccent : Fusion.outline(
                                             control.palette)
            width: control.activeFocus

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
            visible: control.activeFocus
            radius: 1.7
        }

        Rectangle {
            x: 2
            y: 1
            width: parent.width - 4
            height: 1
            color: Fusion.topShadow
        }
    }
}
