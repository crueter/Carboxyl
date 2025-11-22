// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Fusion 6.4
import QtQuick.Controls.Fusion.impl 6.4
import QtQuick.Controls.impl 6.4

import Carboxyl.Clover
import Carboxyl.Contour

Rectangle {
    id: indicator

    readonly property color pressedColor: Fusion.mergedColors(
                                              control.palette.base,
                                              control.palette.windowText, 85)
    readonly property color checkMarkColor: Qt.darker(control.palette.text, 1.2)
    property real baseLightness: 1.2

    property Item control
    x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                      + (control.availableWidth - width) / 2
    y: control.topPadding + (control.availableHeight - height) / 2
    implicitWidth: 20
    implicitHeight: 20

    color: control.down ? indicator.pressedColor : Qt.lighter(
                              control.palette.button, baseLightness)
    border.color: control.visualFocus ? Fusion.highlightedOutline(
                                            control.palette) : Qt.lighter(
                                            Fusion.outline(control.palette),
                                            1.1)

    readonly property bool partiallyChecked: control.checkState === Qt.PartiallyChecked

    ColorImage {
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2

        visible: indicator.control.checked
        color: control.enabled ? palette.buttonText : Palettes.theme.disabledText
        source: "qrc:/qt/qml/Carboxyl/Chroma/Trioxide/images/check.svg"
    }
}
