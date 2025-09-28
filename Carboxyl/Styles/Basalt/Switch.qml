// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.impl 6.4

import Carboxyl.Base

T.Switch {
    id: control

    padding: 6
    spacing: 6

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        implicitBackgroundHeight + topInset + bottomInset,
                        implicitContentHeight + topPadding + bottomPadding,
                        implicitIndicatorHeight + topPadding + bottomPadding)

    indicator: PaddedRectangle {
        implicitWidth: 48
        implicitHeight: 28

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                          + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        radius: 8
        padding: 6
        color: control.checked ? control.palette.highlight : control.palette.midlight

        Rectangle {
            id: handle

            x: Math.max(
                   0, Math.min(
                       parent.width - width,
                       control.visualPosition * parent.width - (width / 2)))
            y: (parent.height - height) / 2
            width: 24
            height: 24
            radius: 16
            color: control.down ? control.palette.light : control.palette.button
            border.width: control.visualFocus ? 2 : 1
            border.color: control.visualFocus ? control.palette.highlight : control.enabled ? control.palette.mid : control.palette.midlight
        }
    }

    contentItem: Label {
        leftPadding: control.indicator
                     && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator
                      && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        verticalAlignment: Text.AlignVCenter
        font: control.font
        color: control.palette.text
    }
}
