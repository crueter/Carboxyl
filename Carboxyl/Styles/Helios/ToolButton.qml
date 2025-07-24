import QtQuick
import QtQuick.Controls.Material
import QtQuick.Controls.Material.impl

import Carboxyl.Base

// TODO: constants for radius padding etc
ToolButton {
    id: control

    Material.foreground: Palettes.theme.buttonText
    Material.background: Palettes.theme.buttonLight
    Material.accent: Palettes.accent.main
    Material.theme: Palettes.theme === Palettes.light ? Material.Light : Material.Dark

    verticalPadding: 5
}
