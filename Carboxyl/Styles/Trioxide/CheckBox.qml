import QtQuick
import QtQuick.Controls.Fusion

import Carboxyl.Base

// TODO: finish this
CheckBox {
    palette {
        text: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        base: Palettes.theme.button
        window: Palettes.theme.text
    }

    id: control
}
