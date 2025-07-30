import QtQuick
import QtQuick.Effects
import QtQuick.Controls.Universal
import QtQuick.Controls.impl

import Carboxyl.Base

TabButton {
    id: control

    property bool coloredIcon: false
    property bool inlineIcon: true

    Universal.foreground: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
    Universal.background: Palettes.theme.buttonLight
    Universal.accent: Palettes.accent.main
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark

    background: Rectangle {
        color: Palettes.theme.buttonLight
    }

    property color textColor: Color.transparent(
                                  enabled
                                  && hovered ? Universal.baseMediumHighColor : Universal.foreground,
                                  checked || down || (enabled
                                                      && hovered) ? 1.0 : 0.2)

    implicitWidth: content.implicitWidth + 10

    Component.onCompleted: {
        if (!inlineIcon) {
            width = TabBar.tabBar.contentWidth
        }
    }

    Behavior on textColor {
        ColorAnimation {
            duration: 150
        }
    }

    TabButtonContent {
        id: content
        control: control
        textColor: control.textColor
        coloredIcon: control.coloredIcon
        inlineIcon: control.inlineIcon
    }

    contentItem: content
}
