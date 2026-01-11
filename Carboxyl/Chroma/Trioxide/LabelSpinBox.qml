// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import Carboxyl.Clover
import Carboxyl.Contour

SpinBox {
    id: control
    editable: true
    topInset: 4

    up.indicator.y: 3

    FloatingPlaceholderText {
        label: control.label
        hasText: true
        backgroundColor: control.backgroundColor
        horizontalOffset: control.up.indicator.width / 2

        horizontalAlignment: control.contentItem.horizontalAlignment
    }
}
