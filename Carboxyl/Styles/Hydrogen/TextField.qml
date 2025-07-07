import QtQuick
import QtQuick.Controls.Universal

import Carboxyl.Base

TextField {
    id: control

    Universal.foreground: Palettes.theme.buttonText
    Universal.background: Palettes.theme.button
    Universal.accent: Palettes.accent.accent
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark
}
