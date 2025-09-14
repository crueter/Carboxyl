// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick

// all the other dialog boxes are broken
// so we have to hack our way into freedom
import QtQuick.Controls.Fusion as F
import QtQuick.Controls

F.DialogButtonBox {
    id: control

    palette {
        buttonText: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
    }

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    spacing: 6
    padding: 6
    alignment: Qt.AlignRight

    delegate: Button {}
}
