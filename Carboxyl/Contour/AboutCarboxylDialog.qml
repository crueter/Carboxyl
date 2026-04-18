// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import Carboxyl.Clover

NativeDialog {
    id: dialog

    title: qsTr("About Carboxyl")

    minimumHeight: label.contentHeight + 10
    minimumWidth: 480

    footer.implicitHeight: 0

    Image {
        id: img
        source: "icons/carboxyl.png"
        width: 150
        height: 150

        anchors {
            left: parent.left
            leftMargin: 10

            verticalCenter: parent.verticalCenter
        }
    }

    Text {
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

        text: qsTr("Carboxyl is a set of utility and design libraries for QML/Qt Quick, designed through years " + // KEEP
                   "of aggregated UI research from a multitude of professional firms and hobbyists.\n\n" + // KEEP
                   "Carboxyl is distributed under the terms of the " + // KEEP
                   "[GNU Lesser Public License v3 (LGPLv3)](https://www.gnu.org/licenses/lgpl-3.0.html). " + // KEEP
                   `You may, at any time, find a copy of the source code at: <${CarboxylConfig.gitLink}>.\n\n`
                   + "Copyleft 2025-2026 [crueter](https://git.crueter.xyz/crueter)") // KEEP

        color: palette.text

        wrapMode: Text.WordWrap

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
