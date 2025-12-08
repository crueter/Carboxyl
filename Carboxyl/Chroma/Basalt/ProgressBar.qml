// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.4
import QtQuick.Controls.Basic.impl

import QtQuick.Shapes

import Carboxyl.Clover
import Carboxyl.Contour

ProgressBar {
    id: control

    implicitWidth: Math.max(24 + leftInset + rightInset,
                            24 + leftPadding + rightPadding)
    implicitHeight: Math.max(24 + topInset + bottomInset,
                             24 + topPadding + bottomPadding)

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
        color: control.palette.highlight
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
