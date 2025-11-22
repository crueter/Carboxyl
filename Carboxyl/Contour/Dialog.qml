// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Effects
import QtQuick.Controls.Basic as F

import Carboxyl.Clover
import Carboxyl.Contour

F.Dialog {
    id: control

    // TODO: configurable per-style
    property int radius: 12

    // height: implicitHeight
    background: Rectangle {
        id: bg
        color: palette.window
        border.color: palette.button
        border.width: 2

        radius: control.radius

        // a bit of depth
        MultiEffect {
            source: bg
            anchors.fill: bg
            shadowBlur: 0.8
            shadowEnabled: true
            shadowColor: control.palette.shadow
            shadowVerticalOffset: 10
            shadowHorizontalOffset: 8
        }
    }

    header: Rectangle {
        visible: title !== ""
        implicitHeight: visible ? 38 : 0

        radius: control.radius

        Rectangle {
            color: 'transparent'
            anchors.fill: parent
            anchors.bottomMargin: -border.width * 8
            radius: control.radius
            border.width: 2
            border.color: control.palette.button
        }

        color: control.palette.window

        border.color: palette.button
        border.width: 0
        clip: true

        Label {
            anchors.fill: parent
            font.pixelSize: 20

            text: title
            font.bold: true

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    // TODO(crueter): buttons seem to disappear on close sometimes
    footer: DialogButtonBox {
        id: buttonBox

        background: Rectangle {
            color: control.palette.window
            clip: true

            // Truly awesome hack where we "only" apply the border to 3 sides
            // I love this
            Rectangle {
                color: control.palette.window

                anchors.topMargin: -border.width * 8
                anchors.fill: parent
                radius: control.radius
                border.width: 2
                border.color: control.palette.button
            }
        }
    }

    enter: Transition {
        NumberAnimation {
            property: "opacity"
            duration: 200

            from: 0.0
            to: 1.0
        }
    }

    exit: Transition {
        NumberAnimation {
            property: "opacity"
            duration: 200

            from: 1.0
            to: 0.0
        }
    }
}
