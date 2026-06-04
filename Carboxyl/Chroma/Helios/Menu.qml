// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Material 6.8

import Carboxyl.Clover
import Carboxyl.Contour
import Carboxyl.Chroma.Helios as H

Menu {
    id: control

    Material.foreground: palette.buttonText
    Material.background: palette.button
    Material.accent: Clover.theme.currentAccent
    Material.theme: Clover.theme === Clover.light ? Material.Light : Material.Dark

    verticalPadding: 5

    delegate: H.MenuItem {}
}
