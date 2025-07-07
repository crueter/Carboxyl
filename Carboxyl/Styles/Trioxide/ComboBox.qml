import QtQuick
import QtQuick.Controls.Fusion

import Carboxyl.Base

ComboBox {
    id: control

    palette {
        buttonText: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
    }
}
