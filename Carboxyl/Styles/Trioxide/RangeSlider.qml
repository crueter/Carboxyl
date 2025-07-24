import QtQuick
import QtQuick.Controls.Fusion

import Carboxyl.Base

RangeSlider {
    palette {
        buttonText: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: enabled ? Palettes.theme.disabledText : Palettes.theme.buttonLight
        highlight: Palettes.accent.main
    }

    id: control
}
