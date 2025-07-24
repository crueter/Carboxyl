import QtQuick
import QtQuick.Controls.FluentWinUI3

import Carboxyl.Base

ToolButton {
    id: control

    palette {
        buttonText: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
    }
}
