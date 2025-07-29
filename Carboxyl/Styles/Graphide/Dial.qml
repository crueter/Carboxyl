import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Shapes

import Carboxyl.Base

Dial {
    palette {
        buttonText: enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
        base: Palettes.theme.button
        window: Palettes.theme.background
        accent: Palettes.accent.main
    }

    id: control

    background: Rectangle {
        id: bg
        implicitWidth: 100
        implicitHeight: 100

        color: "transparent"

        radius: width / 2

        border {
            width: 1
            color: control.palette.buttonText
        }

        Shape {
            anchors.fill: parent
            id: shadow

            implicitWidth: 100
            implicitHeight: 100

            ShapePath {
                startX: 0
                startY: bg.height / 2
                strokeWidth: 1
                strokeColor: "transparent"

                fillGradient: RadialGradient {
                    centerX: bg.width / 2
                    centerY: bg.height / 2
                    focalX: centerX
                    focalY: centerY
                    centerRadius: bg.radius

                    GradientStop {
                        position: 0.75
                        color: Qt.alpha(control.palette.buttonText,
                                        0.2) //"#28FFFFFF"
                    }

                    GradientStop {
                        position: 1.0
                        color: "transparent"
                    }
                }

                PathAngleArc {
                    radiusX: bg.width / 2
                    radiusY: bg.height / 2

                    centerX: bg.width / 2
                    centerY: bg.height / 2

                    startAngle: 0
                    sweepAngle: 360
                }
            }
        }

        Shape {
            anchors.fill: parent
            id: dial

            implicitWidth: 100
            implicitHeight: 100

            ShapePath {
                startX: 0
                startY: bg.height / 2
                strokeWidth: 1
                strokeColor: "transparent"

                fillGradient: RadialGradient {
                    centerX: bg.width / 2
                    centerY: bg.height / 2
                    focalX: centerX
                    focalY: centerY
                    centerRadius: bg.radius

                    GradientStop {
                        position: 0
                        color: control.palette.button
                    }

                    GradientStop {
                        position: 0.91
                        color: control.palette.base
                    }

                    GradientStop {
                        position: 0.911
                        color: "transparent"
                    }
                }

                PathAngleArc {
                    radiusX: bg.width / 2
                    radiusY: bg.height / 2

                    centerX: bg.width / 2
                    centerY: bg.height / 2

                    startAngle: 0
                    sweepAngle: 360
                }
            }
        }
    }

    handle: Rectangle {
        implicitWidth: 100
        implicitHeight: 100

        color: control.palette.accent

        radius: width / 2

        x: control.background.x + control.background.width / 2 - width / 2
        y: control.background.y + control.background.height / 2 - height / 2
        width: control.width / 7
        height: control.height / 7
        transform: [
            Translate {
                y: -Math.min(control.background.width,
                             control.background.height) * 0.35
                   + (control.handle ? control.handle.height / 2 : 0)
            },
            Rotation {
                angle: control.angle
                origin.x: control.handle ? control.handle.width / 2 : 0
                origin.y: control.handle ? control.handle.height / 2 : 0
            }
        ]
    }
}
