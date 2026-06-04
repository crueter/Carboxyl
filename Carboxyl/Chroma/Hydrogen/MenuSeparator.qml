// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later

import QtQuick
import QtQuick.Controls.Universal 6.8

import Carboxyl.Clover
import Carboxyl.Contour

MenuSeparator {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: Clover.theme.currentAccent
    Universal.theme: Clover.theme === Clover.light ? Universal.Light : Universal.Dark
}
