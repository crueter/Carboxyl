import QtQuick
import QtQuick.Controls.Universal

import Carboxyl.Base

Button {
    id: control

    Universal.foreground: Palettes.theme.buttonText
    Universal.background: Palettes.theme.buttonLight
    Universal.accent: Palettes.accent.accent
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark
}
