// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
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

    signal opened
    signal closed

    onVisibilityChanged: {
        if (visible)
            opened()
        else
            closed()
    }

    onOpened: CarboxylApplication.setDarkMode(this)

    function accept() {
        accepted()
        visible = false
    }

    function reject() {
        rejected()
        visible = false
    }

    function open() {
        show()
    }

    property alias standardButtons: buttonBox.standardButtons

    palette: Clover.theme

    background: Rectangle {
        color: palette.window
    }

    footer: DialogButtonBox {
        id: buttonBox

        onAccepted: window.accept()
        onApplied: window.applied()
        onRejected: window.reject()
        onReset: window.reset()
        onClicked: button => {
                       window.buttonClicked(button)
                   }
    }
}
