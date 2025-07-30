import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Shapes
import QtQuick.Templates as T

import Carboxyl.Base

TabButton {
    palette {
        buttonText: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
    }

    id: control
    property bool coloredIcon: false
    property bool inlineIcon: true

    background: Rectangle {
        implicitHeight: 40
        height: control.height - 4

        border.color: Qt.lighter(Fusion.outline(control.palette), 1.1)

        gradient: Gradient {
            GradientStop {
                position: 0
                color: control.checked ? Qt.lighter(Fusion.tabFrameColor(
                                                        control.palette),
                                                    1.04) : Qt.darker(
                                             Fusion.tabFrameColor(
                                                 control.palette), 1.08)
            }
            GradientStop {
                position: control.checked ? 0 : 0.85
                color: control.checked ? Qt.lighter(Fusion.tabFrameColor(
                                                        control.palette),
                                                    1.04) : Qt.darker(
                                             Fusion.tabFrameColor(
                                                 control.palette), 1.08)
            }
            GradientStop {
                position: 1
                color: control.checked ? Fusion.tabFrameColor(
                                             control.palette) : Qt.darker(
                                             Fusion.tabFrameColor(
                                                 control.palette), 1.16)
            }
        }
    }

    property color textColor: palette.buttonText

    verticalPadding: 6

    implicitWidth: content.implicitWidth + 10

    Component.onCompleted: {
        if (!inlineIcon) {
            width = TabBar.tabBar.contentWidth
        }
    }

    TabButtonContent {
        id: content
        control: control
        textColor: control.textColor
        coloredIcon: control.coloredIcon
        inlineIcon: control.inlineIcon
    }

    contentItem: content
}
