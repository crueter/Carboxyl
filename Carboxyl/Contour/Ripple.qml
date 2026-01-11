// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick

import Carboxyl.Clover
import Carboxyl.Contour

// This is a dramatically improved version of the Material/Helios Ripple.
// That thing sucks, don't use it.
Rectangle {
    required property var control

    id: ripple

    width: parent.width * 2
    height: width

    radius: width / 2

    color: Qt.alpha(Clover.theme.currentAccent, 0.25)

    opacity: control.hovered || control.pressed

    anchors.centerIn: parent

    Behavior on opacity {
        NumberAnimation {
            duration: 150
        }
    }
}
