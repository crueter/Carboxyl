// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.4
import QtQuick.Controls.impl

import Carboxyl.Clover
import Carboxyl.Contour

RadioButton {
    id: control

    hoverEnabled: true

    indicator: Rectangle {
        implicitWidth: 18
        implicitHeight: 18

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                          + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        radius: width / 2
        color: control.checked ? Clover.theme.currentAccent : (control.down ? control.palette.light : control.palette.base)
        border.width: control.visualFocus ? 2 : 1
        border.color: (control.visualFocus
                       || control.hovered) ? Clover.theme.currentAccent : control.palette.mid

        Rectangle {
            property int size: control.hovered ? parent.width / 2 + 1 : parent.width / 2 - 1

            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: size
            height: size
            radius: width / 2
            color: control.palette.shadow
            visible: control.checked
        }
    }
}
