import QtQuick
import QtQuick.Controls.FluentWinUI3
import QtQuick.Templates as T

import Carboxyl.Base

TabBar {
    id: control

    palette {
        buttonText: control.enabled ? Palettes.theme.buttonText : Palettes.theme.disabledText
        button: Palettes.theme.buttonLight
        accent: Palettes.accent.main
    }

    property bool vertical: false

    contentItem: ListView {
        id: list
        model: control.contentModel
        currentIndex: control.currentIndex

        spacing: control.__config.spacing
        orientation: vertical ? ListView.Vertical : ListView.Horizontal
        boundsBehavior: Flickable.StopAtBounds
        flickableDirection: Flickable.AutoFlickIfNeeded
        snapMode: ListView.SnapToItem

        highlightMoveDuration: 0
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
                    width: parent.width / 2

                    anchors {
                        horizontalCenter: parent.horizontalCenter
                        bottom: list.isFooter ? parent.top : parent.bottom
                        bottomMargin: list.isFooter ? -height : height * 2
                    }

                    color: control.palette.accent
                }
            }
        }

        Component {
            id: vHighlight

            Item {
                z: 2
                Rectangle {
                    height: parent.height / 2
                    width: 2
                    color: control.palette.accent

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
