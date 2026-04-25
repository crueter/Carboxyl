// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.4
import QtQuick.Controls.Fusion.impl
import QtQuick.Controls.impl

import Carboxyl.Clover
import Carboxyl.Contour

ProgressBar {
    id: control

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 24

        radius: 2
        color: control.palette.button
        border.color: Fusion.outline(control.palette)

        Rectangle {
            x: 1
            y: 1
            height: 1
            width: parent.width - 2
            color: Fusion.topShadow
        }
    }

    contentItem: Item {
        implicitWidth: 120
        implicitHeight: 24
        scale: control.mirrored ? -1 : 1

        Rectangle {
            height: parent.height
            width: (control.indeterminate ? 1.0 : control.position) * parent.width

            radius: 2
            border.color: Fusion.highContrast ? Fusion.outline(
                                                    control.palette) : Qt.darker(
                                                    Clover.theme.highlight, 1.4)
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: Qt.lighter(Clover.theme.highlight, 1.2)
                }
                GradientStop {
                    position: 1
                    color: Clover.theme.highlight
                }
            }
        }

        Item {
            x: 1
            y: 1
            width: parent.width - 2
            height: parent.height - 2
            visible: control.indeterminate
            clip: true

            ColorImage {
                width: Math.ceil(
                           parent.width / implicitWidth + 1) * implicitWidth
                height: parent.height

                mirror: control.mirrored
                fillMode: Image.TileHorizontally
                source: "qrc:/qt-project.org/imports/QtQuick/Controls/Fusion/images/progressmask.png"
                color: Color.transparent(Qt.lighter(Fusion.highlight(
                                                        control.palette), 1.2),
                                         160 / 255)

                visible: control.indeterminate
                NumberAnimation on x {
                    running: control.indeterminate && control.visible
                    from: -31 // progressmask.png width
                    to: 0
                    loops: Animation.Infinite
                    duration: 750
                }
            }
        }
    }
}
