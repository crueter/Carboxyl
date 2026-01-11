// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick

// all the other dialog boxes are broken
// so we have to hack our way into freedom
import QtQuick.Controls.Basic as F
import QtQuick.Controls

F.DialogButtonBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    spacing: 6
    padding: 6
    alignment: Qt.AlignRight

    delegate: Button {
    }
}
