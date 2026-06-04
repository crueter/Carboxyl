// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.8
import QtQuick.Controls.impl 6.8

import Carboxyl.Clover
import Carboxyl.Contour

CheckBox {
    id: control

    indicator: Rectangle {
        implicitWidth: 20
        implicitHeight: 20

        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                          + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2

        color: control.down ? control.palette.mid : (control.checked ? Clover.theme.currentAccent : control.palette.mid)
        border.width: control.visualFocus ? 2 : 1
        border.color: control.down ? Clover.theme.currentAccent : control.palette.dark

        radius: 2

        ColorImage {
            width: parent.width - 1
            height: parent.height - 1

            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            defaultColor: "#353637"
            color: control.palette.text
            source: "qrc:/qt-project.org/imports/QtQuick/Controls/Basic/images/check.png"
            visible: control.checkState === Qt.Checked
        }

        Rectangle {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            width: 16
            height: 3
            color: control.palette.text
            visible: control.checkState === Qt.PartiallyChecked
        }
    }
}
