// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Material 6.4

import Carboxyl.Clover
import Carboxyl.Contour

RangeSlider {
    id: control

    Material.foreground: palette.buttonText
    Material.background: palette.button
    Material.accent: palette.accent
    Material.theme: Palettes.theme === Palettes.light ? Material.Light : Material.Dark

    verticalPadding: 5

    first.handle: Rectangle {
        implicitWidth: 14
        implicitHeight: 14

        color: control.palette.accent

        radius: width / 2

        x: control.leftPadding
           + (control.horizontal ? control.first.visualPosition
                                   * (control.availableWidth
                                      - width) : (control.availableWidth - width) / 2)
        y: control.topPadding
           + (control.horizontal ? (control.availableHeight - height)
                                   / 2 : control.first.visualPosition
                                   * (control.availableHeight - height))

        Ripple {
            control: first
        }
    }

    second.handle: Rectangle {
        implicitWidth: 14
        implicitHeight: 14

        color: control.palette.accent

        radius: width / 2

        x: control.leftPadding
           + (control.horizontal ? control.second.visualPosition
                                   * (control.availableWidth
                                      - width) : (control.availableWidth - width) / 2)
        y: control.topPadding
           + (control.horizontal ? (control.availableHeight - height)
                                   / 2 : control.second.visualPosition
                                   * (control.availableHeight - height))

        Ripple {
            control: second
        }
    }
}
