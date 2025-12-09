// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import Carboxyl.Clover

/// Reimpl. of QProgressDialog
NativeDialog {
    id: dialog

    width: 350
    height: 120 + label.contentHeight

    property string labelText: ""
    property int minimum: 0
    property int maximum: 100
    property int value: 0

    // TODO
    property bool autoClose: false
    property bool autoReset: false
    property bool wasCanceled: false
    property int minimumDuration: 100

    Label {
        id: label
        text: dialog.labelText

        font.pixelSize: 13

        anchors {
            bottom: bar.top
            bottomMargin: 10

            horizontalCenter: parent.horizontalCenter
        }
    }

    ProgressBar {
        id: bar
        indeterminate: to === 0

        anchors.horizontalCenter: parent.horizontalCenter

        from: dialog.minimum
        to: dialog.maximum
        value: dialog.value

        y: (parent.height) / 2

        width: parent.width - 25

        Label {
            anchors.centerIn: parent
            font.pixelSize: 12
            z: 2

            text: Math.round(
                      (dialog.minimum + bar.value) / (dialog.maximum - dialog.minimum) * 100) + "%"
        }
    }

    standardButtons: Dialog.Cancel

    onRejected: wasCanceled = true
}
