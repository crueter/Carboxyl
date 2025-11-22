// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import Carboxyl.Clover
import Carboxyl.Contour

DoubleSpinBox {
    id: dsb

    property string label: ""
    property color backgroundColor: Palettes.theme.window

    contentItem: LabelSpinBox {
        editable: dsb.editable
        inputMethodHints: Qt.ImhFormattedNumbersOnly
        validator: dsb.validator

        property string label: parent.label
        property color backgroundColor: parent.backgroundColor
    }
}
