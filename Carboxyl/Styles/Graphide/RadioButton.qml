import QtQuick
import QtQuick.Controls.FluentWinUI3
import QtQuick.Controls.impl

import Carboxyl.Base

// TODO(crueter): This sucks
RadioButton {
    id: control

    palette {
        text: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        window: Palettes.theme.background
        base: Palettes.theme.background
        accent: Palettes.accent.main
    }
}
