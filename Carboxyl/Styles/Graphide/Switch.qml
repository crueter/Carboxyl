import QtQuick
import QtQuick.Controls.FluentWinUI3
import QtQuick.Controls.FluentWinUI3.impl
import QtQuick.Controls.impl

import Carboxyl.Base

Switch {
    id: control

    palette {
        text: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        accent: Palettes.accent.main
    }
}
