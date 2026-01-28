// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Material 6.4
import Carboxyl.Chroma.Helios as H

import Carboxyl.Clover
import Carboxyl.Contour

MenuBar {
    id: control

    Material.foreground: palette.buttonText
    Material.background: palette.button
    Material.accent: Clover.theme.currentAccent
    Material.theme: Clover.theme === Clover.light ? Material.Light : Material.Dark

    verticalPadding: 5
    background.implicitHeight: 35

    delegate: H.MenuBarItem {}
}
