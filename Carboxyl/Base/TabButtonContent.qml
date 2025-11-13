// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

Item {
    id: content

    required property Item control
    required property color textColor

    property bool coloredIcon: false
    property bool inlineIcon: true

    property alias item: itm

    implicitHeight: itm.height
    implicitWidth: itm.width

    Item {
        id: itm

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Component.onCompleted: {
            if (inlineIcon) {
                width = img.width + txt.width + 5
                height = Math.max(img.height, txt.height) + 5
            } else {
                height = img.height + txt.height + 5
                width = Math.max(img.width, txt.width) + 5
            }
        }

        Image {
            id: img

            source: control.icon.source
            sourceSize: Qt.size(control.icon.width, control.icon.height)

            fillMode: Image.PreserveAspectFit

            mipmap: true

            layer.enabled: content.coloredIcon
            layer.effect: MultiEffect {
                colorization: content.coloredIcon ? 1 : 0
                colorizationColor: content.textColor
            }

            anchors {
                horizontalCenter: inlineIcon ? undefined : parent.horizontalCenter
            }
        }

        Text {
            id: txt

            font: control.font
            text: control.text

            color: content.textColor

            verticalAlignment: Text.AlignVCenter

            anchors {
                left: inlineIcon ? img.right : undefined
                leftMargin: 5

                top: inlineIcon ? undefined : img.bottom
                topMargin: 5

                horizontalCenter: inlineIcon ? undefined : img.horizontalCenter
                verticalCenter: inlineIcon ? img.verticalCenter : parent.verticalCenter
            }
        }
    }
}
