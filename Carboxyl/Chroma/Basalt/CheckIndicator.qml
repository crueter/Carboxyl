// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later

import QtQuick
import QtQuick.Controls.Basic
import QtQuick.Controls.Basic.impl
import QtQuick.Controls.impl

import Carboxyl.Clover
import Carboxyl.Contour

Rectangle {
    id: indicator

    readonly property color pressedColor: control.palette.windowText
    readonly property color checkMarkColor: Qt.darker(control.palette.text, 1.2)
    property real baseLightness: 1.6

    property Item control
    x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                      + (control.availableWidth - width) / 2
    y: control.topPadding + (control.availableHeight - height) / 2
    implicitWidth: 20
    implicitHeight: 20

    color: control.down ? indicator.pressedColor : Qt.lighter(
                              control.palette.base, baseLightness)
    border.color: control.visualFocus ? Basic.highlightedOutline(
                                            control.palette) : Qt.lighter(
                                            Basic.outline(control.palette), 1.1)

    readonly property bool partiallyChecked: control.checkState === Qt.PartiallyChecked

    ColorImage {
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        visible: indicator.control.checked
        color: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        source: "qrc:/qt/qml/Carboxyl/Styles/Basalt/images/check.svg"
    }
}
