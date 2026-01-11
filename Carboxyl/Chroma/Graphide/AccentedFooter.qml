// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later

import QtQuick
import QtQuick.Controls.Fusion

import Carboxyl.Clover
import Carboxyl.Contour

Rectangle {
    required property var control

    color: control.activeFocus ? Clover.theme.currentAccent : palette.text

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
