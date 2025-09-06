// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls.Universal

import Carboxyl.Base

RadioButton {
    id: control

    padding: 4

    Universal.foreground: Palettes.theme.buttonText
    Universal.background: Palettes.theme.button
    Universal.accent: Palettes.accent.main
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark
}
