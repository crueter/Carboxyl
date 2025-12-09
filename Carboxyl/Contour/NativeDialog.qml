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
    signal buttonClicked(Item button)
    signal rejected
    signal reset
    signal closed

    onAccepted: {
        closed()
        close()
    }
    onRejected: {
        closed()
        close()
    }

    onClosing: {
        closed()
    }

    function accept() {
        accepted()
    }

    function reject() {
        rejected()
    }

    property alias standardButtons: buttonBox.standardButtons

    palette: Clover.theme

    background: Rectangle {
        color: palette.window
    }

    footer: DialogButtonBox {
        id: buttonBox

        onAccepted: window.accepted()
        onApplied: window.applied()
        onRejected: window.rejected()
        onReset: window.reset()
        onClicked: button => {
                       window.buttonClicked(button)
                   }
    }
}
