// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Universal 6.4

import Carboxyl.Clover
import Carboxyl.Contour
import Carboxyl.Chroma.Hydrogen as H

Menu {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: Clover.theme.currentAccent
    Universal.theme: Clover.theme === Clover.light ? Universal.Light : Universal.Dark

    delegate: H.MenuItem {}
}
