// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
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

        layer.enabled: control.coloredIcon
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

        Behavior on color {
            ColorAnimation {
                duration: 250
            }
        }
    }

    // TODO: left/right alignment
    // TODO: Horizontal inlines should center the entire thing
    Item {
        id: inline
        visible: inlineIcon

        anchors.fill: parent

        Icon {
            id: inlineIconComponent
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
                leftMargin: 5
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
                bottom: parent.bottom
                horizontalCenter: outlineIconComponent.horizontalCenter
            }
        }
    }
}
