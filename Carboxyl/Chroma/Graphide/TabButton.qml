// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Effects
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

    property color textColor: Color.transparent(Universal.baseMediumHighColor,
                                                checked || down
                                                || (enabled
                                                    && hovered) ? 1.0 : 0.42)

    implicitWidth: content.implicitWidth + 10

    Component.onCompleted: {
        if (vertical) {
            width = TabBar.tabBar.contentWidth
        }
    }

    Behavior on textColor {
        ColorAnimation {
            duration: 150
        }
    }
}
