import QtQuick
import QtQuick.Controls.Universal

import Carboxyl.Base

TextField {
    id: control

    Universal.foreground: Palettes.theme.buttonText
    Universal.background: Palettes.theme.button
    Universal.accent: Palettes.accent.main
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark

    background: Rectangle {
        implicitWidth: 60
        implicitHeight: 28

        border {
            width: 2
            color: !control.enabled ? control.Universal.baseLowColor : control.activeFocus ? Palettes.accent.main : control.hovered ? control.Universal.baseMediumColor : control.Universal.chromeDisabledLowColor

            Behavior on color {
                ColorAnimation {
                    duration: 150
                }
            }
        }

        color: control.enabled ? Palettes.theme.button : control.Universal.baseLowColor
    }
}
