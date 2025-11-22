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

    Universal.foreground: enabled ? palette.buttonText : Palettes.theme.disabledText
    Universal.background: palette.button
    Universal.accent: palette.accent
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark

    background: Item {}

    padding: 6

    property color textColor: Color.transparent(
                                  enabled
                                  && hovered ? Universal.baseMediumHighColor : Universal.foreground,
                                  checked || down || (enabled
                                                      && hovered) ? 1.0 : 0.2)

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
