// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls.Universal 6.4

import Carboxyl.Clover
import Carboxyl.Contour

MenuSeparator {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: palette.accent
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark
}
