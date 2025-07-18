import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl
import QtQuick.Controls.impl

import Carboxyl.Base

Switch {
    id: control

    Material.foreground: Palettes.theme.buttonText
    Material.background: Palettes.theme.buttonLight
    Material.accent: Palettes.accent.main
    Material.theme: Palettes.theme === Palettes.light ? Material.Light : Material.Dark

    // implicitWidth: 20
    // implicitHeight: 20
    indicator: SwitchIndicator {
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                          + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        control: control

        width: 40
        height: 25

        handle.width: 20
        handle.height: 20

        Ripple {
            x: parent.handle.x + parent.handle.width / 2 - width / 2
            y: parent.handle.y + parent.handle.height / 2 - height / 2
            width: 14
            height: 14
            pressed: control.pressed
            active: enabled && (control.down || control.visualFocus
                                || control.hovered)
            color: control.checked ? control.Material.highlightedRippleColor : control.Material.rippleColor
        }
    }
}
