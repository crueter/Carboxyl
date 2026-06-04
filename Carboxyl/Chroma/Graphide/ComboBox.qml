// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick

// for downarrow.png
import QtQuick.Controls.Universal 6.8

import QtQuick.Controls.Basic 6.8
import QtQuick.Controls.impl 6.8
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
        id: itemDelegate

        required property var model
        required property int index

        width: ListView.view.width
        text: model[control.textRole]

        font.pointSize: Math.max(9, control.font.pointSize * 0.8)
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled

        background: Rectangle {
            implicitWidth: 100
            implicitHeight: 30

            radius: width / 20
            visible: itemDelegate.down || itemDelegate.highlighted
                     || itemDelegate.visualFocus
            color: Color.blend(
                       itemDelegate.down ? control.palette.midlight : control.palette.light,
                       control.palette.highlight,
                       control.visualFocus ? 0.15 : 0.0)
        }
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
            highlightMoveDuration: 100

            Rectangle {
                z: 10
                width: parent.width
                height: parent.height
                color: "transparent"
                border.color: control.palette.mid
                radius: width / 20
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
            implicitWidth: 200
            implicitHeight: 30
            color: control.palette.alternateBase
            border.color: control.palette.dark

            radius: width / 20
        }
    }

    background: Rectangle {
        implicitWidth: 140
        implicitHeight: 30

        radius: 10

        color: control.down ? control.palette.mid : control.palette.button
        border.color: control.palette.highlight
        border.width: !control.editable && control.visualFocus ? 2 : 0
        visible: !control.flat || control.down
    }
}
