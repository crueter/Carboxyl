import QtQuick
import QtQuick.Controls.FluentWinUI3

import Carboxyl.Base

// TODO
Dial {
    id: control

    palette {
        buttonText: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
    }
}
