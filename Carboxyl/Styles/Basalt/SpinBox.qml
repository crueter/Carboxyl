// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.4
import QtQuick.Shapes

import Carboxyl.Base

SpinBox {
    id: control

    up.indicator {
        implicitWidth: 30
        implicitHeight: 30
    }

    down.indicator {
        implicitWidth: 30
        implicitHeight: 30
    }

    background {
        implicitWidth: 100
    }
}
