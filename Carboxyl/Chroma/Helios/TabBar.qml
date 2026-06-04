// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Material 6.8
import QtQuick.Templates as T

import Carboxyl.Clover
import Carboxyl.Contour

TabBar {
    id: control

    Material.foreground: palette.buttonText
    Material.background: palette.button
    Material.accent: Clover.theme.currentAccent
    Material.theme: Clover.theme === Clover.light ? Material.Light : Material.Dark

    verticalPadding: 0

    background: Item {}
    contentItem: ListView {
        id: list

        model: control.contentModel
        currentIndex: control.currentIndex

        spacing: control.spacing
        orientation: vertical ? ListView.Vertical : ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.AutoFlickIfNeeded

        highlightMoveDuration: 250
        highlightResizeDuration: 0
        highlightFollowsCurrentItem: true
        highlightRangeMode: ListView.ApplyRange
        preferredHighlightBegin: 48
        preferredHighlightEnd: width - 48

        property bool isFooter: control.position === T.TabBar.Footer

        Component {
            id: hHighlight

            Item {
                z: 2
                Rectangle {
                    height: 2
                    width: parent.width

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        bottom: list.isFooter ? parent.top : parent.bottom
                        bottomMargin: list.isFooter ? -height : 0
                    }

                    color: control.Material.accent
                }
            }
        }

        Component {
            id: vHighlight

            Item {
                z: 2
                Rectangle {
                    height: parent.height
                    width: 2
                    color: control.Material.accent

                    anchors {
                        verticalCenter: parent.verticalCenter
                        right: list.isFooter ? parent.right : parent.left
                        rightMargin: list.isFooter ? 0 : -width
                    }
                }
            }
        }

        highlight: vertical ? vHighlight : hHighlight
    }
}
