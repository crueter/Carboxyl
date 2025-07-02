import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Shapes
import QtQuick.Layouts

import Carboxyl.Helios
import Carboxyl.Base

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property BasePalette currentTheme: Palettes.themes[theme.currentIndex]
    property Accent currentAccent: Palettes.accents[palette.currentIndex]

    background: Rectangle {
        color: currentTheme.background
    }

    ColumnLayout {
        uniformCellSizes: true

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            right: parent.horizontalCenter

            margins: 10
        }

        height: 80

        ComboBox {
            id: palette

            model: Palettes.accents
            textRole: "name"
        }

        RowLayout {
            uniformCellSizes: true

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                color: Palettes.accents[palette.currentIndex].accent
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                color: Palettes.accents[palette.currentIndex].subAccent
            }
        }
    }

    Rectangle {
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            left: parent.horizontalCenter

            margins: 10
        }

        ColumnLayout {
            anchors.fill: parent
            uniformCellSizes: true

            height: 400

            ComboBox {
                id: theme

                model: Palettes.themes
                textRole: "name"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: currentTheme.subBackground

                Text {
                    text: "Hello"
                    color: currentTheme.text
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: currentTheme.dialog

                Text {
                    text: "Woah"
                    color: currentTheme.subText
                }
            }

            Item {
                Button {
                    palette {
                        buttonText: currentTheme.buttonText
                    }

                    id: control
                    hoverEnabled: true

                    property bool needsHighlight: highlighted || hovered
                    property bool cave: down || pressed

                    background: Rectangle {
                        anchors.fill: parent
                        color: currentTheme.button

                        gradient: LinearGradient {
                            y2: height
                            x2: width
                            GradientStop {
                                position: 0.0
                                color: currentTheme.button
                            }
                            GradientStop {
                                position: 1.0
                                color: currentTheme.buttonLight
                            }
                        }

                        radius: 5

                        border {
                            color: control.needsHighlight ? (control.cave ? "transparent" : currentAccent.subAccent) : currentTheme.buttonText
                            Behavior on color {

                                ColorAnimation {
                                    duration: 150
                                }
                            }

                            width: 1
                        }
                    }

                    text: "YOOOOOOOOOOOOOOOOOOOOOOoo"
                }
            }
        }
    }
}
