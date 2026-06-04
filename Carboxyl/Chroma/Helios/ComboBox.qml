// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.Material 6.8
import QtQuick.Controls.Material.impl

import Carboxyl.Clover
import Carboxyl.Contour
import Carboxyl.Chroma.Helios as H

ComboBox {
    id: control

    Material.foreground: palette.buttonText
    Material.background: palette.button
    Material.accent: Clover.theme.currentAccent
    Material.theme: Clover.theme === Clover.light ? Material.Light : Material.Dark

    padding: 0
    spacing: 0
    topInset: 0

    background: MaterialTextContainer {
        implicitWidth: 120
        implicitHeight: 40

        outlineColor: control.palette.button
        focusedOutlineColor: control.Material.accentColor
        controlHasActiveFocus: control.activeFocus
        controlHasText: true
        horizontalPadding: control.Material.textFieldHorizontalPadding
    }

    delegate: H.MenuItem {
        required property var model
        required property int index

        width: ListView.view.width
        text: model[control.textRole]
        Material.foreground: control.currentIndex
                             === index ? Clover.theme.currentAccent : control.palette.buttonText
        highlighted: control.highlightedIndex === index
        hoverEnabled: control.hoverEnabled

        font.pointSize: Math.max(9, control.font.pointSize * 0.8)
    }

    contentItem: H.TextField {
        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: control.down
        inputMethodHints: control.inputMethodHints
        validator: control.validator
        selectByMouse: control.selectTextByMouse

        color: control.enabled ? control.Material.foreground : control.Material.hintTextColor
        selectionColor: control.Material.accentColor
        selectedTextColor: control.Material.primaryHighlightedTextColor
        verticalAlignment: Text.AlignVCenter

        cursorDelegate: CursorDelegate {}
        background: Item {}

        topPadding: 0
        bottomPadding: 0
    }

    popup: T.Popup {
        y: control.editable ? control.height - 5 : 0
        width: control.width
        height: Math.min(contentItem.implicitHeight + verticalPadding * 2,
                         control.Window.height - topMargin - bottomMargin)
        transformOrigin: Item.Top
        topMargin: 12
        bottomMargin: 12
        verticalPadding: 8

        Material.theme: control.Material.theme
        Material.accent: control.Material.accent
        Material.primary: control.Material.primary

        enter: Transition {
            // grow_fade_in
            NumberAnimation {
                property: "scale"
                from: 0.9
                easing.type: Easing.OutQuint
                duration: 220
            }
            NumberAnimation {
                property: "opacity"
                from: 0.0
                easing.type: Easing.OutCubic
                duration: 150
            }
        }

        exit: Transition {
            // shrink_fade_out
            NumberAnimation {
                property: "scale"
                to: 0.9
                easing.type: Easing.OutQuint
                duration: 220
            }
            NumberAnimation {
                property: "opacity"
                to: 0.0
                easing.type: Easing.OutCubic
                duration: 150
            }
        }

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0

            T.ScrollIndicator.vertical: ScrollIndicator {}
        }

        background: Rectangle {
            radius: 4
            color: control.palette.button

            layer.enabled: control.enabled
            layer.effect: RoundedElevationEffect {
                elevation: 4
                roundedScale: Material.ExtraSmallScale
            }
        }
    }
}
