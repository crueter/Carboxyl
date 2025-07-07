import QtQuick
import QtQuick.Controls.Material

import Carboxyl.Base

TextField {
    id: control

    Material.foreground: Palettes.theme.buttonText
    Material.background: Palettes.theme.buttonLight
    Material.accent: Palettes.accent.accent
    Material.theme: Palettes.theme === Palettes.light ? Material.Light : Material.Dark
}
