import QtQuick
import QtQuick.Controls.Fusion

import Carboxyl.Base

// TODO: finish this
TextField {
    id: control

    palette {
        buttonText: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
    }

    background: Rectangle {
        color: Palettes.theme.button

        border {
            color: control.activeFocus ? Palettes.accent.subAccent : Palettes.theme.buttonText
            width: 1 + control.hovered

            Behavior on color {
                ColorAnimation {
                    duration: 150
                }
            }
        }

        width: control.width
        height: control.height
    }
}
