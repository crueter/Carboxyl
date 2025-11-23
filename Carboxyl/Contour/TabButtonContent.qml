// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

Item {
    id: content

    required property Item control

    property color textColor: control.textColor
    property bool coloredIcon: control.coloredIcon
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
            colorization: content.coloredIcon ? 1 : 0
            colorizationColor: content.textColor
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

    // Item {
    //     id: itm

    //     property int realHeight: 0
    //     property int realWidth: 0

    //     // TODO: alignment
    //     anchors.fill: parent

    //     Component.onCompleted: {
    //         if (inlineIcon) {
    //             realWidth = loader.width + 5
    //             realHeight = loader.height + 5
    //         } else {
    //             realWidth = loader.width + 5
    //             realHeight = loader.height + 5
    //         }
    //     }

    //     Loader {
    //         id: loader
    //         sourceComponent: inlineIcon ? new InlineItem() : new OutlineItem()
    //     }
    // }
    // img
    // anchors {
    //     horizontalCenter: inlineIcon ? undefined : parent.horizontalCenter
    //     verticalCenter: inlineIcon ? txt.verticalCenter : undefined
    // }

    // txt
    // TODO: vertical detection
    // anchors {
    //     left: inlineIcon ? img.right : undefined
    //     leftMargin: 5

    //     top: inlineIcon ? undefined : img.bottom
    //     topMargin: 5

    //     horizontalCenter: inlineIcon ? undefined : img.horizontalCenter
    //     verticalCenter: parent.verticalCenter
    // }
}
