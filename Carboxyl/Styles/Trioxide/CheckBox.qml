import QtQuick
import QtQuick.Controls.Universal
import QtQuick.Controls.Universal.impl
import QtQuick.Controls.impl

import Carboxyl.Base

CheckBox {
    id: control

    Universal.foreground: Palettes.theme.buttonText
    Universal.background: Palettes.theme.buttonLight
    Universal.accent: Palettes.accent.aux
    Universal.theme: Palettes.theme === Palettes.light ? Universal.Light : Universal.Dark

    indicator: Rectangle {
        x: control.text ? (control.mirrored ? control.width - width - control.rightPadding : control.leftPadding) : control.leftPadding
                          + (control.availableWidth - width) / 2
        y: control.topPadding + (control.availableHeight - height) / 2
        control: control

        implicitWidth: 20
        implicitHeight: 20

        color: !control.enabled ? "transparent" : control.down
                                  && !partiallyChecked ? control.Universal.baseMediumColor : control.checkState === Qt.Checked ? control.Universal.background : "transparent"
        border.color: !control.enabled ? control.Universal.baseLowColor : control.down ? control.Universal.baseMediumColor : control.checked ? control.Universal.foreground : control.Universal.baseMediumHighColor

        property Item control
        readonly property bool partiallyChecked: control.checkState === Qt.PartiallyChecked

        ColorImage {
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2

            visible: indicator.control.checkState === Qt.Checked
            color: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
            source: "qrc:/qt/qml/Carboxyl/Styles/Trioxide/images/check.svg"
        }
    }
}
