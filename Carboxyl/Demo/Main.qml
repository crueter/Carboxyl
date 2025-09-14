// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import QtQuick.Layouts

import Carboxyl.Base

ApplicationWindow {
    width: 640
    height: 640
    visible: true
    title: qsTr("Carboxyl Demo")

    background: Rectangle {
        color: Palettes.theme.background
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")
            contentWidth: 225

            Action {
                text: qsTr("&Install files...")
            }
            MenuSeparator {}

            Action {
                text: qsTr("L&oad File...")
                shortcut: "Ctrl+O"
            }

            Action {
                text: qsTr("Load &Folder...")
            }

            MenuSeparator {}

            Menu {
                title: "&Other Operations"

                Action {
                    text: qsTr("&Save...")
                    shortcut: "Ctrl+S"
                }

                Action {
                    text: qsTr("Save &As...")
                    shortcut: "Ctrl+Shift+S"
                }
            }

            MenuSeparator {}

            Action {
                text: qsTr("Open &Application Directory")
            }

            MenuSeparator {}

            Action {
                text: qsTr("E&xit")
                shortcut: "Ctrl+Q"
            }
        }

        Menu {
            title: qsTr("&View")
            contentWidth: 260

            Action {
                text: qsTr("F&ullscreen")
                shortcut: "F11"
                checkable: true
            }

            MenuSeparator {}

            Action {
                text: qsTr("Show &Status Bar")
                shortcut: "Ctrl+S"
                checkable: true
            }
        }
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

            model: ["Trioxide", "Helios", "Hydrogen"]

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

        Dialog {
            popupType: Popup.Native
            title: "Dialog"
            id: dialog

            anchors.centerIn: Overlay.overlay

            Label {
                text: "This is a native dialog"
                anchors.fill: parent
            }
            standardButtons: Dialog.Ok | Dialog.Cancel | Dialog.Apply
        }

        RoundButton {
            text: "Dialog"
            enabled: swt.checked
            onClicked: dialog.open()
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

        id: left

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

            SpinBox {
                enabled: swt.checked

                from: -100
                to: 100000000

                Layout.preferredWidth: 300
                editable: true
            }
        }
    }

    CarboxylTabBar {
        id: vertTab
        vertical: true

        anchors {
            left: parent.left
            bottom: parent.bottom
            leftMargin: 5
        }

        position: TabBar.Footer

        contentHeight: 60
        contentWidth: 100

        height: contentHeight * count + 20
        width: 100

        // TODO(crueter): Handle native controls(?)
        CarboxylTabButton {
            text: "V - Errors"
            icon.height: 20
            icon.width: 20
            icon.source: "qrc:/Demo/icons/crit.svg"
            inlineIcon: false
        }
        CarboxylTabButton {
            text: "V - Settings"
            icon.source: "qrc:/Demo/icons/Miscellaneous.svg"
            icon.height: 20
            icon.width: 20
            coloredIcon: true
            inlineIcon: false
        }
        CarboxylTabButton {
            text: "V - Verification"
            icon.source: "qrc:/Demo/icons/valid.svg"
            icon.height: 20
            icon.width: 20
            coloredIcon: true
            inlineIcon: false
        }
        CarboxylTabButton {
            text: "V - Information"
            icon.height: 20
            icon.width: 20
            icon.source: "qrc:/Demo/icons/info.svg"
            inlineIcon: false
        }
    }

    CarboxylTabBar {
        id: tab
        anchors {
            left: vertTab.right
            right: parent.right
            bottom: parent.bottom

            leftMargin: 15
        }

        position: TabBar.Footer

        CarboxylTabButton {
            text: "Errors"
            icon.source: "qrc:/Demo/icons/crit.svg"
            icon.height: 20
            icon.width: 20
            inlineIcon: true
        }
        CarboxylTabButton {
            text: "Settings"
            icon.source: "qrc:/Demo/icons/Miscellaneous.svg"
            icon.height: 20
            icon.width: 20
            coloredIcon: true
            inlineIcon: true
        }
        CarboxylTabButton {
            text: "Verification"
            icon.source: "qrc:/Demo/icons/valid.svg"
            icon.height: 20
            icon.width: 20
            coloredIcon: true
            inlineIcon: true
        }
        CarboxylTabButton {
            text: "Information"
            icon.source: "qrc:/Demo/icons/info.svg"
            icon.height: 20
            icon.width: 20
            inlineIcon: true
        }
    }
}
