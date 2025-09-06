// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

import Carboxyl.Base

SpinBox {
    id: control

    Material.foreground: Palettes.theme.buttonText
    Material.background: Palettes.theme.buttonLight
    Material.accent: Palettes.accent.main
    Material.theme: Palettes.theme === Palettes.light ? Material.Light : Material.Dark

    verticalPadding: 5

    down.indicator.implicitHeight: 40
    up.indicator.implicitHeight: 40
    background.implicitHeight: 40
}
