// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick
import QtQuick.Controls
import Carboxyl.Clover

NativeDialog {
    id: dialog

    // TODO: color, alignment?
    // TODO: markdown mode
    property string text: ""

    property int icon: CarboxylEnums.NoIcon
    property bool hasIcon: icon !== CarboxylEnums.NoIcon
    property string iconSource
    property alias textFormat: label.textFormat

    onIconChanged: {
        var svgName
        switch (icon) {
        case CarboxylEnums.Warning:
            svgName = "warning"
            break
        case CarboxylEnums.Critical:
            svgName = "critical"
            break
        case CarboxylEnums.Question:
            svgName = "question"
            break
        case CarboxylEnums.Information:
        default:
            svgName = "information"
            break
        }

        iconSource = `icons/${svgName}.svg`
    }

    minimumHeight: Math.max(label.contentHeight, img.height) + footer.height + 10
    minimumWidth: hasIcon ? 325 : 250

    Image {
        id: img
        source: dialog.iconSource
        width: dialog.hasIcon ? 50 : 0
        height: dialog.hasIcon ? 50 : 0

        anchors {
            left: parent.left
            leftMargin: 5
            verticalCenter: parent.verticalCenter
        }
    }

    // Text does not support mouse selection (wtf)
    Text {
        id: label

        anchors {
            left: img.right
            right: parent.right

            top: parent.top
            bottom: parent.bottom

            margins: 5
        }

        padding: 0
        leftPadding: 4

        onLinkActivated: link => Qt.openUrlExternally(link)

        text: dialog.text
        color: palette.text

        wrapMode: Text.WordWrap

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
    }
}
