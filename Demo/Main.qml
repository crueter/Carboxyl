import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import QtQuick.Layouts

import Carboxyl.Base

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Qt if it was good")

    background: Rectangle {
        color: Palettes.theme.background
    }

    ColumnLayout {
        anchors {
            top: parent.top
            left: parent.left
            right: parent.horizontalCenter

            margins: 10
        }

        height: 160

        Text {
            text: CarboxylApplication.styleName
            color: Palettes.theme.text
            font.pixelSize: 20
        }

        ComboBox {
            id: style

            model: ["Trioxide", "Graphide", "Helios", "Hydrogen"]

            Layout.fillWidth: true
            enabled: swt.checked

            Component.onCompleted: {
                currentIndex = model.indexOf(CarboxylApplication.styleName)
            }

            onCurrentIndexChanged: Settings.set("style", model[currentIndex])
        }

        ComboBox {
            id: palette

            model: Palettes.accents
            textRole: "name"

            Layout.fillWidth: true
            enabled: swt.checked

            onCurrentIndexChanged: Palettes.accent = Palettes.accents[palette.currentIndex]
        }

        RowLayout {
            uniformCellSizes: true

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                color: Palettes.accent.main
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true

                color: Palettes.accent.aux
            }
        }

        Switch {
            id: swt
            checked: true
            text: "Switch"
        }

        RadioButton {
            checked: true
            enabled: swt.checked
            text: "Option 1"
        }

        RadioButton {
            enabled: swt.checked
            text: "Option 2"
        }

        RoundButton {
            text: "hi"
            enabled: swt.checked
        }

        ToolButton {
            text: "ToolButton"
            enabled: swt.checked
        }
    }

    Rectangle {
        anchors {
            top: parent.top
            right: parent.right
            left: parent.horizontalCenter

            margins: 10
        }

        ColumnLayout {
            anchors.fill: parent
            height: 400

            ComboBox {
                id: theme

                model: Palettes.themes
                textRole: "name"
                enabled: swt.checked

                // TODO settings for accent and theme
                Component.onCompleted: {
                    currentIndex = Palettes.themes.indexOf(Palettes.theme)
                    currentIndexChanged.connect(
                                () => Palettes.theme = Palettes.themes[theme.currentIndex])
                }
            }

            TextField {
                Layout.fillWidth: true
                height: 40
                enabled: swt.checked
                placeholderText: "Placeholder"
            }

            Rectangle {
                Layout.fillWidth: true

                Layout.preferredHeight: 40
                color: Palettes.theme.subBackground

                Text {
                    text: "Text on SubBackground"
                    color: Palettes.theme.text
                }
            }

            Rectangle {
                Layout.fillWidth: true

                Layout.preferredHeight: 40
                color: Palettes.theme.dialog

                Text {
                    text: "SubText on Dialog"
                    color: Palettes.theme.subText
                }
            }

            RowLayout {
                Layout.preferredHeight: 30

                CheckBox {
                    checked: true
                    onCheckedChanged: btn.enabled = checked
                    text: "Enabled"
                }

                Button {
                    id: btn
                    text: "Button"
                }
            }

            Dial {
                enabled: swt.checked
            }

            Slider {
                enabled: swt.checked
            }

            RangeSlider {
                enabled: swt.checked

                from: 0
                to: 100
                first.value: 25
                second.value: 75
            }
        }
    }
}
