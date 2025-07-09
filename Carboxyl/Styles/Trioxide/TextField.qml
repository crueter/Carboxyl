import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Controls.impl

import Carboxyl.Base

TextField {
    palette {
        text: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        base: Palettes.theme.button
        window: Palettes.theme.text
    }

    id: control

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 24

        radius: 2
        color: control.palette.base
        border {
            color: control.activeFocus ? Palettes.accent.main : Fusion.outline(
                                             control.palette)
            width: 1 + control.activeFocus

            Behavior on color {
                ColorAnimation {
                    duration: 150
                }
            }
        }

        Rectangle {
            x: 1
            y: 1
            width: parent.width - 2
            height: parent.height - 2
            color: "transparent"
            border.color: Color.transparent(Fusion.highlightedOutline(
                                                control.palette), 40 / 255)
            visible: control.activeFocus
            radius: 1.7
        }

        Rectangle {
            x: 2
            y: 1
            width: parent.width - 4
            height: 1
            color: Fusion.topShadow
        }
    }
}
