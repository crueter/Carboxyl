import QtQuick
import QtQuick.Controls.FluentWinUI3

import Carboxyl.Base

TabButton {
    id: control
    property bool coloredIcon: false
    property bool inlineIcon: true

    palette {
        buttonText: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
        accent: Palettes.accent.main
    }

    property color textColor: control.down ? __pressedText : control.hovered ? __hoveredText : control.palette.buttonText

    implicitWidth: content.implicitWidth + 10

    Component.onCompleted: {
        if (!inlineIcon) {
            width = TabBar.tabBar.contentWidth
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

    background: Item {}
}
