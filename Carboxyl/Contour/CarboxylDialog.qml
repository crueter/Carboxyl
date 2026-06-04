// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Basic as F

import Carboxyl.Clover
import Carboxyl.Contour

F.Dialog {
    id: control

    signal buttonClicked(Item button)

    property var windowHandle: contentItem.Window.window
    property bool isItem: control.parent !== null
                          && windowHandle === control.parent.Window.window

    // Make it very clear that this is a separate dialog.
    modal: true
    dim: true

    anchors.centerIn: Overlay.overlay

    // There's a funny bug in Qt where the window contents are destroyed before the underlying
    // native window is released/hidden. This can cause eyesores where the content of the
    // window shrinks down dramatically while the window is closing.
    onAboutToHide: if (!isItem)
                       contentItem.Window.window.hide()

    onAboutToShow: {
        if (!isItem) {
            CarboxylApplication.setDarkMode(windowHandle)
            windowHandle.minimumHeight = implicitHeight
            windowHandle.minimumWidth = implicitWidth
        }
    }

    onImplicitHeightChanged: if (windowHandle !== null && !isItem) {
                                 windowHandle.minimumHeight = implicitHeight
                             }

    onImplicitWidthChanged: if (windowHandle !== null && !isItem) {
                                windowHandle.minimumWidth = implicitWidth
                            }

    // TODO: configurable per-style
    property int radius: isItem ? 12 : 0

    // height: implicitHeight
    background: Rectangle {
        id: bg
        color: palette.window
        border.color: palette.button
        border.width: isItem ? 2 : 0

        radius: control.radius
    }

    header: Rectangle {
        visible: title !== "" && isItem
        implicitHeight: visible ? 38 : 0

        radius: control.radius

        // only apply the border to 3 sides
        Rectangle {
            color: 'transparent'
            anchors.fill: parent
            anchors.bottomMargin: -border.width * 8
            radius: control.radius
            border.width: 2
            border.color: control.palette.button
        }

        color: control.palette.window

        clip: true

        Label {
            anchors.fill: parent
            font.pixelSize: 20

            text: title
            font.bold: true

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
        }
    }

    footer: DialogButtonBox {
        id: buttonBox

        background: Rectangle {
            color: control.palette.window
            clip: true

            // only apply the border to 3 sides
            Rectangle {
                color: control.palette.window

                anchors.topMargin: -border.width * 8
                anchors.fill: parent
                radius: control.radius
                border.width: isItem ? 2 : 0
                border.color: control.palette.button
            }
        }

        onClicked: button => {
                       control.buttonClicked(button)
                   }
    }

    enter: Transition {
        NumberAnimation {
            property: "opacity"
            duration: isItem ? 200 : 0

            from: 0.0
            to: 1.0
        }
    }

    exit: Transition {
        NumberAnimation {
            property: "opacity"
            duration: isItem ? 200 : 0

            from: 1.0
            to: 0.0
        }
    }

    Overlay.modal: Rectangle {
        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }

        // TODO: verify Windows/macOS behavior
        color: Qt.alpha(control.palette.shadow, isItem ? 0.5 : 0)
    }

    Overlay.modeless: Rectangle {
        Behavior on opacity {
            NumberAnimation {
                duration: 200
            }
        }

        color: Qt.alpha(control.palette.shadow, 0.12)
    }
}
