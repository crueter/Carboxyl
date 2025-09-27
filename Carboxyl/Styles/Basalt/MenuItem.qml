// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Shapes

import Carboxyl.Base
import Carboxyl.Styles.Basalt as T

MenuItem {
    id: control

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 20

        color: control.down
               || control.highlighted ? control.palette.highlight : control.palette.button
    }
}
