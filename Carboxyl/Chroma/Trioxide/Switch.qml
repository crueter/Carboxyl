// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.8
import QtQuick.Controls.impl 6.8
import QtQuick.Controls.Fusion.impl

import Carboxyl.Clover
import Carboxyl.Contour

Switch {
    id: control

    palette {
        highlight: Clover.theme.currentAccent
    }
}
