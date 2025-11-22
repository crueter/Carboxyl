// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import Carboxyl.Clover
import Carboxyl.Contour

ComboBox {
    id: control

    FloatingPlaceholderText {
        label: control.label
        hasText: control.contentItem.length > 0
        backgroundColor: control.backgroundColor

        horizontalAlignment: control.contentItem.horizontalAlignment
    }
}
