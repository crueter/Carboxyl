// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick

import Carboxyl.Clover
import Carboxyl.Contour

Rectangle {
    id: rect

    implicitWidth: txt.contentWidth + 8
    implicitHeight: txt.contentHeight

    color: "transparent"

    property Item control: parent

    property color backgroundColor: control.palette.base
    property color textColor: focused ? Clover.theme.currentAccent : control.palette.placeholderText
    property bool focused: control.activeFocus
    property bool hasText: false
    property bool needsBlocker: y < 0
    property string label: control.label

    property int horizontalAlignment: control.horizontalAlignment
    property int horizontalOffset: 0
    property int verticalOffset: 0

    Rectangle {
        color: backgroundColor

        visible: rect.needsBlocker

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.verticalCenter
            bottomMargin: -(control.font.pixelSize / 2)
            top: parent.top
        }
    }

    Behavior on y {
        SmoothedAnimation {
            duration: 250
            velocity: -1
        }
    }

    Behavior on textColor {
        ColorAnimation {
            duration: 150
        }
    }

    x: {
        switch (horizontalAlignment) {
        case Text.AlignJustify:
        case Text.AlignLeft:
            control.leftPadding
            break
        case Text.AlignHCenter:
            control.width / 2 - width / 2 - horizontalOffset
            break
        case Text.AlignRight:
            control.width - width - control.rightPadding
            break
        default:
            break
        }
    }

    y: hasText ? (-height / 2 + 2 - verticalOffset) : (control.height / 2 - height / 2 + 2)

    scale: {
        if (!hasText)
            return 1.0

        let baseScale = 0.75
        let overflow = Math.max(0, control.font.pixelSize - 12)
        return Math.max(0.3, baseScale - (overflow * 0.0225))
    }

    Behavior on scale {
        SmoothedAnimation {
            duration: 350
            velocity: -1
        }
    }

    Text {
        anchors {
            fill: parent
            leftMargin: 4
        }

        horizontalAlignment: Text.AlignLeft

        id: txt
        padding: 0
        color: rect.textColor

        text: rect.label

        font: control.font
    }
}
