// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.8
import QtQuick.Controls.impl 6.8

import Carboxyl.Clover
import Carboxyl.Contour
import Carboxyl.Chroma.Trioxide as T

CheckBox {
    id: control

    indicator: T.CheckIndicator {
        control: control
    }
}
