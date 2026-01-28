// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Material 6.4

import Carboxyl.Clover
import Carboxyl.Contour

TabButton {
    id: control

    property bool vertical: TabBar.tabBar.vertical

    Material.foreground: palette.buttonText
    Material.background: palette.button
    Material.accent: Clover.theme.currentAccent
    Material.theme: Clover.theme === Clover.light ? Material.Light : Material.Dark

    property color textColor: !enabled ? Material.hintTextColor : down
                                         || checked ? Clover.theme.currentAccent : palette.buttonText

    implicitWidth: content.implicitWidth + 10

    Component.onCompleted: {
        if (vertical) {
            width = TabBar.tabBar.contentWidth
        }
    }

    background: Rectangle {
        color: hovered ? Material.rippleColor : "transparent"

        Behavior on color {
            ColorAnimation {
                easing.type: Easing.InOutQuad
                duration: 150
            }
        }
    }
}
