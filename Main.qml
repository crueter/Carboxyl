import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import QtQuick.Layouts

import Carboxyl.Base

import Carboxyl.Styles.Helios as H

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

        height: 120

        ComboBox {
            id: palette

            model: Palettes.accents
            textRole: "name"

            Component.onCompleted: console.log(Palettes.accents)

            Layout.fillWidth: true

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
            height: 400

            ComboBox {
                id: theme

                model: Palettes.themes
                textRole: "name"

                Component.onCompleted: currentIndex = Palettes.themes.indexOf(
                                           Palettes.theme)

                onCurrentIndexChanged: Palettes.theme = Palettes.themes[theme.currentIndex]
            }

            TextField {
                Layout.fillWidth: true
                height: 40
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
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    checked: true
                    onCheckedChanged: btn.enabled = checked
                }

                Button {
                    id: btn
                    text: "Button"
                }
            }
        }
    }
}
