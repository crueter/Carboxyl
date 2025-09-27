// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls.impl

import Carboxyl.Base

Dial {
    id: control

    palette {
        dark: Palettes.theme.text
    }

    background.implicitHeight: 120
    background.implicitWidth: 120
}
