import QtQuick
import QtQuick.Controls.Fusion

import Carboxyl.Base

TextField {
    palette {
        text: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        base: Palettes.theme.buttonLight
        window: Palettes.theme.text
        accent: Palettes.accent.aux
    }

    id: control

    background: Rectangle {
        implicitWidth: 120
        implicitHeight: 24

        radius: 5

        color: control.palette.base
    }

    Rectangle {
        color: control.activeFocus ? palette.accent : palette.text
        Behavior on color {
            ColorAnimation {
                duration: 150
            }
        }

        height: (control.hovered || control.activeFocus) ? 2 : 1

        anchors {
            left: parent.left
            right: parent.right

            bottom: parent.bottom

            leftMargin: 5
            rightMargin: 5
            bottomMargin: 2
        }
    }
}
