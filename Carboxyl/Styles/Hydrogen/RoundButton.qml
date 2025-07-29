import QtQuick
import QtQuick.Controls.Universal

import Carboxyl.Base

RoundButton {
    id: control

    Universal.foreground: Palettes.theme.buttonText
    Universal.background: Palettes.theme.button
    Universal.accent: Palettes.accent.main
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark
}
