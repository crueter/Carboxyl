// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

import QtQuick
import QtQuick.Controls.Universal

import Carboxyl.Base

TextField {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: palette.accent
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark

    background: Rectangle {
        implicitWidth: 60
        implicitHeight: 28

        border {
            width: 2
            color: !control.enabled ? control.Universal.baseLowColor : control.activeFocus ? palette.accent : control.hovered ? control.Universal.baseMediumColor : control.Universal.chromeDisabledLowColor
        }

        color: control.enabled ? palette.button : control.Universal.baseLowColor
    }
}
