// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.8
import QtQuick.Shapes

import Carboxyl.Clover
import Carboxyl.Contour
import Carboxyl.Chroma.Basalt as T

Menu {
    id: control
    delegate: T.MenuItem {}
}
