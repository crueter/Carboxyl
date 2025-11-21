// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import Carboxyl.Base

ComboBox {
    id: control

    FloatingPlaceholderText {
        label: control.label
        hasText: control.contentItem.length > 0
        backgroundColor: control.backgroundColor
        needsBlocker: false

        horizontalAlignment: control.contentItem.horizontalAlignment

        verticalOffset: 2
    }
}
