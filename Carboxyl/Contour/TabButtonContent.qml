// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

Item {
    id: content

    required property Item control

    property color textColor: control.textColor
    property bool inlineIcon: control.inlineIcon
    property bool vertical: control.vertical

    property Item item: inlineIcon ? inline : outOfLine

    implicitHeight: item.height
    implicitWidth: item.width

    component Icon: Image {
        id: img

        source: control.icon.source
        sourceSize: Qt.size(control.icon.width, control.icon.height)

        fillMode: Image.PreserveAspectFit

        mipmap: true

        layer.enabled: true
        layer.effect: MultiEffect {
            colorization: 1
            colorizationColor: control.icon.color

            Behavior on colorizationColor {
                ColorAnimation {
                    duration: 250
                }
            }
        }
    }

    component ButtonLabel: Text {
        id: txt

        font: control.font
        text: control.text

        color: content.textColor

        verticalAlignment: Text.AlignVCenter
    }

    // TODO: left/right alignment
    Item {
        id: inline
        visible: inlineIcon

        anchors.fill: parent

        Icon {
            id: inlineIconComponent
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
        }

        ButtonLabel {
            anchors {
                left: inlineIconComponent.right
                leftMargin: 5
                verticalCenter: inlineIconComponent.verticalCenter
            }
        }
    }

    // TODO: Top/bottom alignment
    Item {
        id: outOfLine
        visible: !inlineIcon

        anchors.fill: parent

        Icon {
            id: outlineIconComponent
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
            }
        }

        ButtonLabel {
            anchors {
                top: control.icon.source != "" ? outlineIconComponent.bottom : parent.top
                topMargin: (control.icon.source != "") * 5
                horizontalCenter: outlineIconComponent.horizontalCenter
            }
        }
    }
}
