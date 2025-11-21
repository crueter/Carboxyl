// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import Carboxyl.Base

TextField {
    id: control

    FloatingPlaceholderText {
        id: floating
        hasText: control.length > 0
        backgroundColor: control.backgroundColor

        horizontalAlignment: control.horizontalAlignment
    }
}
