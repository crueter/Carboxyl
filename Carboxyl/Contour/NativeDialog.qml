// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls

import Carboxyl.Clover
import Carboxyl.Contour

ApplicationWindow {
    id: window

    signal accepted
    signal applied
    signal rejected
    signal reset

    onAccepted: close()
    onRejected: close()

    property alias standardButtons: buttonBox.standardButtons

    palette: transientParent.palette

    background: Rectangle {
        color: palette.window
    }

    footer: DialogButtonBox {
        id: buttonBox

        onAccepted: window.accepted()
        onApplied: window.applied()
        onRejected: window.rejected()
        onReset: window.reset()
    }
}
