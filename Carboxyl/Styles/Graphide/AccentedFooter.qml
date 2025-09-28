// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls.Fusion

import Carboxyl.Base

Rectangle {
    required property var control

    color: control.activeFocus ? palette.accent : palette.text

    Behavior on color {
        ColorAnimation {
            duration: 150
        }
    }

    height: (control.hovered || control.activeFocus) ? 2 : 1

    anchors {
        left: parent.left
        right: parent.right

        bottom: parent.bottom

        leftMargin: 5
        rightMargin: 5
        bottomMargin: 2
    }
}
