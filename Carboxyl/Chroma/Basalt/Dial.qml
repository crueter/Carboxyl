// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.4
import QtQuick.Controls.impl 6.4

import Carboxyl.Clover
import Carboxyl.Contour

Dial {
    id: control

    palette {
        dark: Clover.theme.currentAccent
    }

    background.implicitHeight: 120
    background.implicitWidth: 120
}
