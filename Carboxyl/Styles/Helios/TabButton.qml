import QtQuick
import QtQuick.Controls.Material

import Carboxyl.Base

TabButton {
    id: control

    property bool coloredIcon: false
    property bool inlineIcon: true

    Material.foreground: Palettes.theme.buttonText
    Material.background: Palettes.theme.buttonLight
    Material.accent: Palettes.accent.main
    Material.theme: Palettes.theme === Palettes.light ? Material.Light : Material.Dark

    verticalPadding: 5

    property color textColor: !enabled ? Material.hintTextColor : down
                                         || checked ? Material.accentColor : Material.foreground

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
}
