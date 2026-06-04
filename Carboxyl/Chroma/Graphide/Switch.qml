// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Universal 6.8
import QtQuick.Templates as T

import Carboxyl.Clover
import Carboxyl.Contour

Switch {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: Clover.theme.currentAccent
    Universal.theme: Clover.theme === Clover.light ? Universal.Light : Universal.Dark

    spacing: 4

    contentItem: Text {
        leftPadding: control.indicator
                     && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator
                      && control.mirrored ? control.indicator.width + control.spacing : 0

        text: control.text
        font: control.font
        elide: Text.ElideRight
        verticalAlignment: Text.AlignVCenter

        opacity: enabled ? 1.0 : 0.2
        color: control.Universal.foreground
    }

    indicator: Item {
        id: indicator
        implicitWidth: 44
        implicitHeight: 20

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                          + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        Rectangle {
            width: parent.width
            height: parent.height

            radius: 12
            color: !control.enabled ? "transparent" : control.pressed ? control.Universal.baseMediumColor : control.checked ? control.Universal.accent : "transparent"
            border.color: !control.enabled ? control.Universal.baseLowColor : control.checked
                                             && !control.pressed ? control.Universal.accent : control.hovered && !control.checked && !control.pressed ? control.Universal.baseHighColor : control.Universal.baseMediumColor
            opacity: enabled && control.hovered && control.checked
                     && !control.pressed ? (control.Universal.theme
                                            === Universal.Light ? 0.7 : 0.9) : 1.0
            border.width: 2
        }

        Rectangle {
            width: 14
            height: 14
            radius: width / 2

            color: !control.enabled ? control.Universal.baseLowColor : control.pressed
                                      || control.checked ? control.Universal.chromeWhiteColor : control.hovered && !control.checked ? control.Universal.baseHighColor : control.Universal.baseMediumHighColor

            x: Math.max(
                   5, Math.min(
                       parent.width - width - 5,
                       control.visualPosition * parent.width - (width / 2)))
            y: (parent.height - height) / 2

            Behavior on x {
                enabled: !control.pressed
                SmoothedAnimation {
                    velocity: 200
                }
            }
        }
    }
}
