// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.4
import QtQuick.Shapes

import Carboxyl.Clover
import Carboxyl.Contour
import Carboxyl.Chroma.Trioxide as T

Menu {
    id: control
    delegate: T.MenuItem {}
}
