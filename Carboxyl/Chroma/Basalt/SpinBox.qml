// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.8
import QtQuick.Shapes

import Carboxyl.Clover
import Carboxyl.Contour

SpinBox {
    id: control

    implicitWidth: Math.max(
                       implicitBackgroundWidth + leftInset + rightInset,
                       contentItem.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(
                        implicitBackgroundHeight + topInset + bottomInset,
                        implicitContentHeight + topPadding + bottomPadding,
                        up.implicitIndicatorHeight,
                        down.implicitIndicatorHeight) + topInset

    up.indicator: Rectangle {
        y: control.topInset
        x: control.mirrored ? 0 : control.width - width
        height: control.height - topInset
        implicitWidth: 30
        implicitHeight: 30
        color: control.up.pressed ? control.palette.mid : control.palette.button

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width / 3
            height: 2
            color: enabled ? control.palette.buttonText : control.palette.mid
        }
        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 2
            height: parent.width / 3
            color: enabled ? control.palette.buttonText : control.palette.mid
        }
    }

    down.indicator: Rectangle {
        y: control.topInset
        x: control.mirrored ? parent.width - width : 0
        height: control.height - topInset
        implicitWidth: 30
        implicitHeight: 30
        color: control.down.pressed ? control.palette.mid : control.palette.button

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: parent.width / 3
            height: 2
            color: enabled ? control.palette.buttonText : control.palette.mid
        }
    }

    background: Rectangle {
        implicitWidth: 100
        color: enabled ? control.palette.base : control.palette.button
        border.color: control.palette.button
    }

    contentItem: TextInput {
        z: 2
        text: control.displayText
        clip: width < implicitWidth
        padding: 0

        font: control.font
        color: control.palette.text
        selectionColor: control.palette.highlight
        selectedTextColor: control.palette.highlightedText
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: Qt.AlignVCenter

        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: control.inputMethodHints

        Rectangle {
            width: parent.width
            height: parent.height - control.topInset
            y: control.topInset
            visible: control.activeFocus
            color: "transparent"
            border.color: Clover.theme.currentAccent
            border.width: 2
        }
    }
}
