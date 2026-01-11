// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Universal 6.4
import QtQuick.Controls.impl

import Carboxyl.Clover
import Carboxyl.Contour

SpinBox {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.button
    Universal.accent: Clover.theme.currentAccent
    Universal.theme: Clover.theme === Clover.light ? Universal.Light : Universal.Dark

    background: Rectangle {
        implicitWidth: 60 + 28 // TextControlThemeMinWidth - 4 (border)
        implicitHeight: 28 // TextControlThemeMinHeight - 4 (border)

        border.width: 2 // TextControlBorderThemeThickness
        border.color: !control.enabled ? control.Universal.baseLowColor : control.activeFocus ? control.Universal.accent : control.hovered ? control.Universal.baseMediumColor : control.Universal.chromeDisabledLowColor
        color: !control.enabled ? control.Universal.baseLowColor : control.Universal.altMediumLowColor
    }

    contentItem: TextInput {
        text: control.displayText

        font: control.font
        color: !enabled ? control.Universal.chromeDisabledLowColor : control.Universal.foreground
        selectionColor: control.Universal.accent
        selectedTextColor: control.Universal.chromeWhiteColor
        horizontalAlignment: Qt.AlignHCenter
        verticalAlignment: TextInput.AlignVCenter

        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: control.inputMethodHints
        clip: width < implicitWidth
    }

    up.indicator: Item {
        implicitWidth: 28
        height: control.height + 4
        y: -2
        x: control.mirrored ? 0 : control.width - width

        Rectangle {
            x: 2
            y: 4
            width: parent.width - 4
            height: parent.height - 8
            color: control.activeFocus ? control.Universal.accent : control.up.pressed ? control.Universal.baseMediumLowColor : control.up.hovered ? control.Universal.baseLowColor : "transparent"
            visible: control.up.pressed || control.up.hovered
            opacity: control.activeFocus && !control.up.pressed ? 0.4 : 1.0
        }

        ColorImage {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            color: !enabled ? control.Universal.chromeDisabledLowColor : control.Universal.baseHighColor
            source: "qrc:/qt-project.org/imports/QtQuick/Controls/Universal/images/"
                    + (control.mirrored ? "left" : "right") + "arrow.png"
        }
    }

    down.indicator: Item {
        implicitWidth: 28
        height: control.height + 4
        y: -2
        x: control.mirrored ? control.width - width : 0

        Rectangle {
            x: 2
            y: 4
            width: parent.width - 4
            height: parent.height - 8
            color: control.activeFocus ? control.Universal.accent : control.down.pressed ? control.Universal.baseMediumLowColor : control.down.hovered ? control.Universal.baseLowColor : "transparent"
            visible: control.down.pressed || control.down.hovered
            opacity: control.activeFocus && !control.down.pressed ? 0.4 : 1.0
        }

        ColorImage {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            color: !enabled ? control.Universal.chromeDisabledLowColor : control.Universal.baseHighColor
            source: "qrc:/qt-project.org/imports/QtQuick/Controls/Universal/images/"
                    + (control.mirrored ? "right" : "left") + "arrow.png"
        }
    }
}
