// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import Carboxyl.Clover
import Carboxyl.Contour

TextField {
    id: control

    FloatingPlaceholderText {
        id: floating
        hasText: control.length > 0
        backgroundColor: control.backgroundColor

        horizontalAlignment: control.horizontalAlignment
    }
}
