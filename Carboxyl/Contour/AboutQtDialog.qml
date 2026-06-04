// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls

import Carboxyl.Clover
import Carboxyl.Contour

CarboxylDialog {
    id: dialog

    popupType: Popup.Window

    title: qsTr("About Qt")

    implicitHeight: label.contentHeight + 10 + footer.height
    implicitWidth: 600
    standardButtons: Dialog.Ok

    Image {
        id: img
        source: "icons/qt.webp"
        width: 150
        height: 107

        anchors {
            left: parent.left

            top: parent.top

            margins: 10
        }
    }

    Label {
        id: label

        anchors {
            left: img.right
            right: parent.right

            top: parent.top
            bottom: parent.bottom

            margins: 5
        }

        padding: 0
        leftPadding: 4

        textFormat: Text.MarkdownText

        onLinkActivated: link => Qt.openUrlExternally(link)

        text: qsTr("<h3>About Qt</h3>" // KEEP
                   + "<p>This program uses Qt version %1.</p>" // KEEP
                   + "<p>Qt is a C++ toolkit for cross-platform application " // KEEP
                   + "development.</p>" // KEEP
                   + "<p>Qt provides single-source portability across all major desktop " // KEEP
                   + "operating systems. It is also available for embedded Linux and other " // KEEP
                   + "embedded and mobile operating systems.</p>" // KEEP
                   + "<p>Qt is available under multiple licensing options designed " // KEEP
                   + "to accommodate the needs of our various users.</p>" // KEEP
                   + "<p>Qt licensed under our commercial license agreement is appropriate " // KEEP
                   + "for development of proprietary/commercial software where you do not " // KEEP
                   + "want to share any source code with third parties or otherwise cannot " // KEEP
                   + "comply with the terms of GNU (L)GPL.</p>" // KEEP
                   + "<p>Qt licensed under GNU (L)GPL is appropriate for the " // KEEP
                   + "development of Qt&nbsp;applications provided you can comply with the terms  // KEEP"
                   + "and conditions of the respective licenses.</p>" // KEEP
                   + "<p>Please see <a href=\"https://qt.io/licensing\">qt.io/licensing</a> " // KEEP
                   + "for an overview of Qt licensing.</p>" // KEEP
                   + "<p>Copyright (C) The Qt Company Ltd. and other " // KEEP
                   + "contributors.</p>" // KEEP
                   + "<p>Qt and the Qt logo are trademarks of The Qt Company Ltd.</p>" // KEEP
                   + "<p>Qt is The Qt Company Ltd. product developed as an open source " // KEEP
                   + "project. See <a href=\"https://qt.io\">qt.io</a> for more information.</p>" // KEEP
                   ).arg(CarboxylApplication.qtVersion)

        wrapMode: Text.WordWrap

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
