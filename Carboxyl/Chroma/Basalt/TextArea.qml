// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.8
import QtQuick.Controls.impl 6.8

import Carboxyl.Clover
import Carboxyl.Contour

// TODO(crueter): Floating placeholder text
TextArea {
    id: control

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40
        border.width: control.activeFocus ? 2 : 1
        color: control.palette.base
        border.color: control.activeFocus ? Clover.theme.currentAccent : control.palette.mid
    }
}
