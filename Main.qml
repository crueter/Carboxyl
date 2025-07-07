import QtQuick
import QtQuick.Controls.Fusion
import QtQuick.Shapes
import QtQuick.Layouts

import Carboxyl.Components
import Carboxyl.Base

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    background: Rectangle {
        color: Palettes.theme.background
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
            id: style

            model: Palettes.styles

            onCurrentIndexChanged: Palettes.style = Palettes.styles[currentIndex]
        }

        ComboBox {
            id: palette

            model: Palettes.accents
            textRole: "name"

            onCurrentIndexChanged: Palettes.accent = Palettes.accents[currentIndex]
        }

        RowLayout {
            uniformCellSizes: true

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                color: Palettes.accent.accent
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                color: Palettes.accent.subAccent
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

                Component.onCompleted: {
                    console.log(Palettes.theme === Palettes.light,
                                Palettes.themes.indexOf(Palettes.theme))
                }
                currentIndex: Palettes.themes.indexOf(Palettes.theme)

                onCurrentIndexChanged: Palettes.theme = Palettes.themes[currentIndex]
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: Palettes.theme.subBackground

                Text {
                    text: "Text on SubBackground"
                    color: Palettes.theme.text
                }
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: Palettes.theme.dialog

                Text {
                    text: "SubText on Dialog"
                    color: Palettes.theme.subText
                }
            }

            RowLayout {
                CheckBox {
                    checked: true
                    onCheckedChanged: btn.enabled = checked
                }

                Button {
                    id: btn
                    text: "Button"

                    Connections {
                        target: btn.item
                        function onClicked() {
                            btn.item.text = "Clicked!"
                        }
                    }
                }
            }
        }
    }
}
