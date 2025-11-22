// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick

// for downarrow.png
import QtQuick.Controls.Universal 6.4

import QtQuick.Controls.Basic 6.4
import QtQuick.Controls.impl 6.4
import QtQuick.Templates as T

import Carboxyl.Clover
import Carboxyl.Contour

ComboBox {
    id: control

    indicator: ColorImage {
        x: control.mirrored ? control.padding : control.width - width - control.padding
        y: control.topPadding + (control.availableHeight - height) / 2
        color: control.palette.text
        defaultColor: "#353637"
        source: "qrc:/qt-project.org/imports/QtQuick/Controls/Universal/images/downarrow.png"
        opacity: enabled ? 1 : 0.3
    }

    delegate: ItemDelegate {
        required property var model
        required property int index

        width: ListView.view.width
        text: model[control.textRole]
        palette.text: control.palette.text
        palette.highlightedText: control.palette.accent
        font.weight: control.currentIndex === index ? Font.DemiBold : Font.Normal
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled
    }

    popup: T.Popup {
        y: control.height
        width: control.width
        height: Math.min(contentItem.implicitHeight,
                         control.Window.height - topMargin - bottomMargin)
        topMargin: 6
        bottomMargin: 6
        palette: control.palette

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0

            Rectangle {
                z: 10
                width: parent.width
                height: parent.height
                color: "transparent"
                border.color: control.palette.mid
            }

            T.ScrollIndicator.vertical: ScrollIndicator {}
        }

        enter: Transition {
            NumberAnimation {
                property: "height"
                from: control.popup.height / 3
                to: control.popup.height
                easing.type: Easing.OutCubic
                duration: 250
            }
        }

        background: Rectangle {
            color: control.palette.window
        }
    }

    background {
        implicitWidth: 140
        implicitHeight: 35
    }
}
