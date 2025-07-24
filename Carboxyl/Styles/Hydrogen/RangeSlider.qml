import QtQuick
import QtQuick.Controls.Universal

import Carboxyl.Base

RangeSlider {
    id: control

    Universal.foreground: Palettes.theme.buttonText
    Universal.background: Palettes.theme.buttonLight
    Universal.accent: Palettes.accent.main
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark
}
