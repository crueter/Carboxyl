import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Controls.impl

import Carboxyl.Base

Switch {
    id: control

    palette {
        text: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        base: Palettes.accent.main
        window: Palettes.theme.text
        highlight: Palettes.accent.aux
    }
}
