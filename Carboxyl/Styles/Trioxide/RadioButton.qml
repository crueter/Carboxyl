// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.4
import QtQuick.Controls.Fusion.impl
import QtQuick.Controls.impl 6.4

import Carboxyl.Base

RadioButton {
    id: control

    indicator: Rectangle {
        id: indicator

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                          + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        readonly property color pressedColor: Fusion.mergedColors(
                                                  control.palette.base,
                                                  control.palette.windowText,
                                                  85)
        readonly property color checkMarkColor: control.palette.windowText

        implicitWidth: 14
        implicitHeight: 14

        radius: width / 2
        color: control.down ? indicator.pressedColor : Qt.lighter(
                                  control.palette.button, 1.4)
        border.color: control.visualFocus ? Fusion.highlightedOutline(
                                                control.palette) : Qt.darker(
                                                control.palette.button, 1.2)
        border.width: 2
        border.pixelAligned: false

        Rectangle {
            y: 1
            width: parent.width
            height: parent.height - 1
            radius: width / 2
            color: "transparent"
            border.color: Fusion.topShadow
            visible: control.enabled && !control.down
        }

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width / 2.32
            height: parent.height / 2.32
            radius: width / 2
            color: Color.transparent(indicator.checkMarkColor, 180 / 255)
            border.color: Color.transparent(indicator.checkMarkColor, 200 / 255)
            visible: control.checked
        }
    }
}
