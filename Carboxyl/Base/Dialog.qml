// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick

// all the other dialogs are broken
// so we have to hack our way into freedom
import QtQuick.Controls.Fusion as F

import Carboxyl.Base

F.Dialog {
    id: control

    palette {
        window: Palettes.theme.dialog
        buttonText: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
    }

    background: Rectangle {
        color: palette.window
        border.color: palette.button
        border.width: 1
    }
    Component.onCompleted: console.log("HI")

    // TODO(crueter): buttons seem to disappear on close
    footer: DialogButtonBox {
        visible: true
    }
}
