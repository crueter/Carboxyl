// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.4

import Carboxyl.Clover
import Carboxyl.Contour

RangeSlider {
    id: control

    first.handle: Rectangle {
        x: control.leftPadding
           + (control.horizontal ? control.first.visualPosition
                                   * (control.availableWidth
                                      - width) : (control.availableWidth - width) / 2)
        y: control.topPadding
           + (control.horizontal ? (control.availableHeight - height)
                                   / 2 : control.first.visualPosition
                                   * (control.availableHeight - height))
        implicitWidth: 24
        implicitHeight: 24
        radius: width / 2
        border.width: 1
        border.color: activeFocus ? Clover.theme.currentAccent : control.enabled ? control.palette.mid : control.palette.midlight
        color: control.first.pressed ? control.palette.light : control.palette.button
    }

    second.handle: Rectangle {
        x: control.leftPadding
           + (control.horizontal ? control.second.visualPosition
                                   * (control.availableWidth
                                      - width) : (control.availableWidth - width) / 2)
        y: control.topPadding
           + (control.horizontal ? (control.availableHeight - height)
                                   / 2 : control.second.visualPosition
                                   * (control.availableHeight - height))
        implicitWidth: 24
        implicitHeight: 24
        radius: width / 2
        border.width: 1
        border.color: activeFocus ? Clover.theme.currentAccent : control.enabled ? control.palette.mid : control.palette.midlight
        color: control.second.pressed ? control.palette.light : control.palette.button
    }

    background: Rectangle {
        x: control.leftPadding + (control.horizontal ? 0 : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : 0)
        implicitWidth: control.horizontal ? 200 : 6
        implicitHeight: control.horizontal ? 6 : 200
        width: control.horizontal ? control.availableWidth : implicitWidth
        height: control.horizontal ? implicitHeight : control.availableHeight
        radius: 3
        color: control.palette.midlight
        scale: control.horizontal && control.mirrored ? -1 : 1

        Rectangle {
            x: control.horizontal ? control.first.position * parent.width + 3 : 0
            y: control.horizontal ? 0 : control.second.visualPosition * parent.height + 3
            width: control.horizontal ? control.second.position * parent.width
                                        - control.first.position * parent.width - 6 : 6
            height: control.horizontal ? 6 : control.second.position * parent.height
                                         - control.first.position * parent.height - 6

            color: Clover.theme.currentAccent
        }
    }
}
