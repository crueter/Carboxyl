// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Controls.impl

import Carboxyl.Base

SpinBox {
    id: control

    Universal.foreground: palette.buttonText
    Universal.background: palette.base
    Universal.accent: palette.accent
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 30

        radius: 10

        color: control.palette.base
    }

    contentItem: TextInput {
        text: control.displayText

        font: control.font
        color: control.palette.text
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
            color: control.palette.text
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
            color: control.palette.text
            source: "qrc:/qt-project.org/imports/QtQuick/Controls/Universal/images/"
                    + (control.mirrored ? "right" : "left") + "arrow.png"
        }
    }

    AccentedFooter {
        control: control
    }
}
