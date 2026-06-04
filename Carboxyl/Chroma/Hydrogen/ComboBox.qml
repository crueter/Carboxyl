// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Universal 6.8

import Carboxyl.Clover
import Carboxyl.Contour

ComboBox {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: Clover.theme.currentAccent
    Universal.theme: Clover.theme === Clover.light ? Universal.Light : Universal.Dark

    delegate: ItemDelegate {
        required property var model
        required property int index

        width: ListView.view.width
        text: model[control.textRole]
        font.pointSize: Math.max(9, control.font.pointSize * 0.8)
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
    }
}
