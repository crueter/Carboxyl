import QtQuick
import QtQuick.Controls as T
import QtQuick.Controls.FluentWinUI3

import Carboxyl.Base

ComboBox {
    id: control

    palette {
        text: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        accent: Palettes.accent.main
    }

    // FluentWinUI3's indicator and background don't use palettes for some reason
    indicator: Canvas {
        id: canvas
        x: control.width - width - control.__config.rightPadding
        y: control.topPadding + (control.availableHeight - height) / 2
        width: control.font.pixelSize * 0.8
        height: width * 2 / 3
        contextType: "2d"

        Connections {
            target: control
            function onPressedChanged() {
                canvas.requestPaint()
            }
        }

        Connections {
            target: control.palette

            function onTextChanged() {
                canvas.requestPaint()
            }
        }

        onPaint: {
            context.reset()
            context.moveTo(0, 0)
            context.lineTo(width, 0)
            context.lineTo(width / 2, height)
            context.closePath()
            context.fillStyle = control.palette.text
            context.fill()
        }
    }

    background: Rectangle {
        color: Palettes.theme.button

        border {
            color: control.hovered ? Palettes.accent.aux : Palettes.theme.buttonText
            width: 1 + control.hovered

            Behavior on color {
                ColorAnimation {
                    duration: 150
                }
            }
        }

        width: control.width
        height: control.height
    }
}
