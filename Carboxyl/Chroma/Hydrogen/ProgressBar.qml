// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Universal 6.4
import QtQuick.Controls.Universal.impl

import Carboxyl.Clover
import Carboxyl.Contour

ProgressBar {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: Clover.theme.currentAccent
    Universal.theme: Clover.theme === Clover.light ? Universal.Light : Universal.Dark

    topInset: 0
    bottomInset: 0
    leftInset: 0
    rightInset: 0

    contentItem: ProgressBarImpl {
        implicitHeight: 24
        implicitWidth: 116
        scale: control.mirrored ? -1 : 1
        progress: control.position
        indeterminate: control.visible && control.indeterminate
        color: Clover.theme.highlight
    }

    background: Rectangle {
        radius: 2
        implicitWidth: 200
        implicitHeight: 24
        y: (control.height - height) / 2
        height: 6

        color: control.palette.button
    }
}
