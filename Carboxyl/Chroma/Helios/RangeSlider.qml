// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Material 6.8

import Carboxyl.Clover
import Carboxyl.Contour

RangeSlider {
    id: control

    Material.foreground: palette.buttonText
    Material.background: palette.button
    Material.accent: Clover.theme.currentAccent
    Material.theme: Clover.theme === Clover.light ? Material.Light : Material.Dark

    verticalPadding: 5

    first.handle: Rectangle {
        implicitWidth: 14
        implicitHeight: 14

        color: Clover.theme.currentAccent

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

        color: Clover.theme.currentAccent

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
