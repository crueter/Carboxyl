// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.4
import QtQuick.Shapes
import QtQuick.Templates as T

import Carboxyl.Clover
import Carboxyl.Contour

TabButton {
    id: control

    property bool vertical: TabBar.tabBar.vertical

    background: Rectangle {
        implicitHeight: 40
        height: control.height - 4

        border.color: Qt.lighter(Fusion.outline(control.palette), 1.1)

        gradient: Gradient {
            GradientStop {
                position: 0
                color: control.checked ? Qt.lighter(Fusion.tabFrameColor(
                                                        control.palette),
                                                    1.04) : Qt.darker(
                                             Fusion.tabFrameColor(
                                                 control.palette), 1.08)
            }
            GradientStop {
                position: control.checked ? 0 : 0.85
                color: control.checked ? Qt.lighter(Fusion.tabFrameColor(
                                                        control.palette),
                                                    1.04) : Qt.darker(
                                             Fusion.tabFrameColor(
                                                 control.palette), 1.08)
            }
            GradientStop {
                position: 1
                color: control.checked ? Fusion.tabFrameColor(
                                             control.palette) : Qt.darker(
                                             Fusion.tabFrameColor(
                                                 control.palette), 1.16)
            }
        }
    }

    property color textColor: palette.buttonText

    verticalPadding: 6

    // implicitWidth: content.implicitWidth + 10
    Component.onCompleted: {
        if (vertical) {
            width = TabBar.tabBar.contentWidth
        }
    }
}
