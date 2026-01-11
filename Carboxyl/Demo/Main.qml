// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import QtQuick.Shapes
import QtQuick.Layouts

import Carboxyl.Clover
import Carboxyl.Contour

ApplicationWindow {
    width: 900
    height: 700
    visible: true
    title: qsTr("Carboxyl Demo")

    palette: Clover.theme

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
            color: Clover.theme.text
            font.pixelSize: 20
        }

        CarboxylLabeledComboBox {
            id: style

            model: CarboxylConfig.styles

            Layout.fillWidth: true
            enabled: swt.checked

            label: "Style"

            Component.onCompleted: {
                currentIndex = model.indexOf(CarboxylApplication.styleName)
            }

            onCurrentIndexChanged: Settings.set("style", model[currentIndex])
        }

        CarboxylLabeledComboBox {
            id: accent

            model: Clover.accents
            textRole: "name"

            label: "Accent"

            Layout.fillWidth: true
            enabled: swt.checked

            // TODO settings for accent and theme
            Component.onCompleted: {
                currentIndex = Clover.accents.indexOf(Clover.accent)
                currentIndexChanged.connect(
                            () => Clover.accent = Clover.accents[accent.currentIndex])
            }
        }

        Switch {
            id: swt
            checked: true
            text: "Switch"
        }

        RowLayout {
            RadioButton {
                checked: true
                enabled: swt.checked
                text: "Option 1"
            }

            RadioButton {
                enabled: swt.checked
                text: "Option 2"
            }
        }

        Dialog {
            title: "Dialog"
            id: dialog

            anchors.centerIn: Overlay.overlay

            Label {
                text: "This is a dialog"
            }
            standardButtons: Dialog.Ok | Dialog.Cancel | Dialog.Apply
        }

        NativeDialog {
            title: "Dialog"
            id: nativeDialog

            width: 400
            height: 500

            // anchors.centerIn: Overlay.overlay
            Label {
                text: "This is a dialog"
                anchors.fill: parent

                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            standardButtons: Dialog.Ok | Dialog.Cancel | Dialog.Apply
        }

        ProgressDialog {
            title: "Progress"
            id: progress

            labelText: "Progress Bar :)"

            value: slider.value
            minimum: 0
            maximum: 100
        }

        RowLayout {
            RoundButton {
                text: "Dialog"
                enabled: swt.checked
                onClicked: dialog.open()
            }

            RoundButton {
                text: "Native Dialog"
                enabled: swt.checked
                onClicked: nativeDialog.show()
            }
        }

        RowLayout {
            RoundButton {
                text: "Progress"
                enabled: swt.checked
                onClicked: progress.show()
            }

            RoundButton {
                text: "From C++"
                enabled: swt.checked
                onClicked: CarboxylQuickInterface.showMessageBox(
                               CarboxylEnums.Warning,
                               qsTr("C++ Message Dialog"), qsTr(
                                   "This is a message box created from C++.\n"
                                   + "Multiline text support, blah blah blah word wrapping "
                                   + "and such yay! This is created via a series of horrible hacks."
                                   + " Plus, if the text is too long, the dialog"
                                   + "\nwill\nautomatically\nexpand\nitself\nto\nfit\nany text!\n\n\n\n\n\n\n\n\nwoo"),
                               DialogButtonBox.Ok)
            }
            ToolButton {
                text: "ToolButton"
                enabled: swt.checked
            }
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

        color: Clover.theme.base

        ColumnLayout {
            anchors.fill: parent
            height: 400

            CarboxylLabeledComboBox {
                id: theme

                model: Clover.themes
                textRole: "name"
                enabled: swt.checked

                label: "Theme"

                // TODO settings for accent and theme
                Component.onCompleted: {
                    currentIndex = Clover.themes.indexOf(Clover.theme)
                    currentIndexChanged.connect(
                                () => Clover.theme = Clover.themes[theme.currentIndex])
                }
            }

            TextField {
                Layout.fillWidth: true
                height: 40
                enabled: swt.checked
                placeholderText: "Placeholder"
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
                id: dial
                enabled: swt.checked
                from: -100
                to: 100

                value: slider.value
            }

            Slider {
                id: slider
                enabled: swt.checked
                from: -100
                to: 100

                value: dial.value
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

            CarboxylLabeledSpinBox {
                enabled: swt.checked

                from: -100
                to: 100000000

                Layout.preferredWidth: 300
                editable: true
                label: "Spin Box"
            }

            CarboxylLabeledDoubleSpinBox {
                enabled: swt.checked

                from: -100
                to: 100000000

                Layout.preferredWidth: 300
                editable: true
                stepSize: 0.1
                label: "Double Spin Box"
            }

            CarboxylLabeledTextField {
                Layout.preferredWidth: 300
                height: 40
                enabled: swt.checked
                label: "Placeholder"
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

        contentHeight: 55
        contentWidth: 130

        height: contentItem.contentHeight + 20
        width: contentWidth

        CarboxylTabButton {
            text: "Errors"
            icon.height: 30
            icon.width: 30
            icon.source: "qrc:/qt/qml/Carboxyl/Contour/icons/critical.svg"
            inlineIcon: true
        }
        CarboxylTabButton {
            text: "Settings"
            icon.source: "qrc:/Demo/icons/Miscellaneous.svg"
            icon.height: 20
            icon.width: 20
            inlineIcon: false
            coloredIcon: true
        }
        CarboxylTabButton {
            text: "Verification"
            icon.source: "qrc:/Demo/icons/valid.svg"
            icon.height: 20
            icon.width: 20
            inlineIcon: false
            coloredIcon: true
        }
        CarboxylTabButton {
            text: "Information"
            icon.height: 30
            icon.width: 30
            icon.source: "qrc:/qt/qml/Carboxyl/Contour/icons/information.svg"
            inlineIcon: true
        }
    }

    CarboxylTabBar {
        id: tab

        anchors {
            left: vertTab.right
            right: vertTabRight.left
            bottom: parent.bottom

            margins: 15
        }

        contentHeight: 60
        contentWidth: 100

        position: TabBar.Footer

        CarboxylTabButton {
            text: "Errors"
            icon.source: "qrc:/qt/qml/Carboxyl/Contour/icons/critical.svg"
            icon.height: 20
            icon.width: 20
            inlineIcon: false
        }
        CarboxylTabButton {
            text: "Settings"
            icon.source: "qrc:/Demo/icons/Miscellaneous.svg"
            icon.height: 30
            icon.width: 30
            inlineIcon: true
        }
        CarboxylTabButton {
            text: "Verification"
            icon.source: "qrc:/Demo/icons/valid.svg"
            icon.height: 30
            icon.width: 30
            inlineIcon: true
        }
        CarboxylTabButton {
            text: "Information"
            icon.source: "qrc:/qt/qml/Carboxyl/Contour/icons/information.svg"
            icon.height: 20
            icon.width: 20
            inlineIcon: false
        }
    }

    CarboxylTabBar {
        id: vertTabRight
        vertical: true

        anchors {
            right: parent.right
            bottom: parent.bottom
            rightMargin: 5
        }

        position: TabBar.Header

        contentHeight: 55
        contentWidth: 130

        height: contentItem.contentHeight + 20
        width: contentWidth

        CarboxylTabButton {
            text: "Errors"
            icon.height: 30
            icon.width: 30
            icon.source: "qrc:/qt/qml/Carboxyl/Contour/icons/critical.svg"
            inlineIcon: true
        }

        CarboxylTabButton {
            text: "Settings"
            icon.source: "qrc:/Demo/icons/Miscellaneous.svg"
            icon.height: 30
            icon.width: 30
            inlineIcon: true
            coloredIcon: true
        }
        CarboxylTabButton {
            text: "Verification"
            icon.source: "qrc:/Demo/icons/valid.svg"
            icon.height: 30
            icon.width: 30
            inlineIcon: true
            coloredIcon: true
        }
        CarboxylTabButton {
            text: "Information"
            icon.height: 30
            icon.width: 30
            icon.source: "qrc:/qt/qml/Carboxyl/Contour/icons/information.svg"
            inlineIcon: true
        }
    }
}
