// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.4
import QtQuick.Controls.impl 6.4
import QtQuick.Controls.Fusion.impl

import Carboxyl.Clover
import Carboxyl.Contour

Switch {
    id: control

    palette {
        highlight: Clover.theme.currentAccent
    }
}
