// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Universal 6.8
import Carboxyl.Chroma.Hydrogen as H

import Carboxyl.Clover
import Carboxyl.Contour

MenuBar {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: Clover.theme.currentAccent
    Universal.theme: Clover.theme === Clover.light ? Universal.Light : Universal.Dark

    background.implicitHeight: 35

    delegate: H.MenuBarItem {}
}
