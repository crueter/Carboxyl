// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.4
import QtQuick.Templates as T

import Carboxyl.Clover
import Carboxyl.Contour

TabBar {
    id: control

    contentItem: ListView {
        id: list
        model: control.contentModel
        currentIndex: control.currentIndex

        height: parent.height

        spacing: control.spacing
        orientation: vertical ? ListView.Vertical : ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.AutoFlickIfNeeded

        highlightMoveDuration: 0
        highlightRangeMode: ListView.ApplyRange
        preferredHighlightBegin: 40
        preferredHighlightEnd: width - 40

        property bool isFooter: control.position === T.TabBar.Footer

        Component {
            id: hHighlight

            Item {
                z: 2
                Rectangle {
                    height: 3
                    width: parent.width / 2

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        bottom: list.isFooter ? parent.top : parent.bottom
                        bottomMargin: list.isFooter ? -height : height * 2
                    }

                    color: Clover.theme.currentAccent
                }
            }
        }

        Component {
            id: vHighlight

            Item {
                z: 2
                Rectangle {
                    height: parent.height / 2
                    width: 3
                    color: Clover.theme.currentAccent

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
