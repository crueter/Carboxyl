// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Universal 6.4
import QtQuick.Controls.impl 6.4

import Carboxyl.Clover
import Carboxyl.Contour

TabButton {
    id: control

    property bool vertical: TabBar.tabBar.vertical

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: Clover.theme.currentAccent
    Universal.theme: Clover.theme === Clover.light ? Universal.Light : Universal.Dark

    background: Item {}

    padding: 6

    property color textColor: enabled
                              && hovered ? Color.transparent(
                                               Clover.theme.currentAccent,
                                               1.2) : (down
                                                       || checked ? Clover.theme.currentAccent : palette.buttonText)

    icon.color: textColor

    implicitWidth: content.implicitWidth + 10

    Component.onCompleted: {
        if (vertical) {
            width = TabBar.tabBar.contentWidth
        }
    }
}
