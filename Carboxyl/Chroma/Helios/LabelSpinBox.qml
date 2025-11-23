// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import Carboxyl.Clover
import Carboxyl.Contour

SpinBox {
    id: control
    editable: true
    topInset: 4

    FloatingPlaceholderText {
        label: control.label
        hasText: true
        backgroundColor: control.backgroundColor

        horizontalAlignment: control.contentItem.horizontalAlignment
    }
}
