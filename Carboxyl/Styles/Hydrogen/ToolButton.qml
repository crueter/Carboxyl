import QtQuick
import QtQuick.Controls.Universal

import Carboxyl.Base

ToolButton {
    id: control

    Universal.foreground: Palettes.theme.buttonText
    Universal.background: Palettes.theme.buttonLight
    Universal.accent: Palettes.accent.main
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark

    background: Rectangle {
        implicitWidth: 56
        implicitHeight: 30

        color: control.enabled
               && (control.highlighted
                   || control.checked) ? control.Universal.accent : "transparent"

        Rectangle {
            width: parent.width
            height: parent.height
            visible: enabled && (control.down || control.hovered)
            color: control.down ? control.Universal.listMediumColor : control.Universal.listLowColor
        }
    }
}
