import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

Item {
    id: content

    required property Item control
    required property color textColor
    property bool coloredIcon: false
    property bool inlineIcon: true

    property alias item: itm

    implicitHeight: itm.height
    implicitWidth: itm.width

    Item {
        id: itm

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        Component.onCompleted: {
            if (inlineIcon) {
                width = img.width + txt.width + 5
                height = Math.max(img.height, txt.height) + 5
            } else {
                height = img.height + txt.height + 5
                width = Math.max(img.width, txt.width) + 5
            }
        }

        Image {
            id: img

            source: control.icon.source
            sourceSize: Qt.size(control.icon.width, control.icon.height)

            fillMode: Image.PreserveAspectFit

            mipmap: true

            layer.enabled: content.coloredIcon
            layer.effect: MultiEffect {
                colorization: content.coloredIcon ? 1 : 0
                colorizationColor: content.textColor
            }

            anchors {
                horizontalCenter: inlineIcon ? undefined : parent.horizontalCenter
            }
        }

        Text {
            id: txt

            font: control.font
            text: control.text

            color: content.textColor

            anchors {
                left: inlineIcon ? img.right : undefined
                leftMargin: 5

                top: inlineIcon ? undefined : img.bottom
                topMargin: 5

                horizontalCenter: inlineIcon ? undefined : parent.horizontalCenter
            }
        }
    }
}

/*
import QtQuick
import QtQuick.Layouts
import QtQuick.Effects

Item {
    id: content

    required property Item control
    required property color textColor
    property bool coloredIcon: false
    property bool inlineIcon: true

    property Item contentItem: inlineIcon ? horizontal : vertical

    implicitHeight: inlineIcon ? Math.max(
                                     txt.height,
                                     img.sourceSize.height) : txt.height + 5 + img.sourceSize.height

    implicitWidth: inlineIcon ? txt.width + 5 + img.sourceSize.width : Math.max(
                                    txt.width, img.sourceSize.width)

    anchors.fill: parent

    Image {
        id: img

        source: control.icon.source
        sourceSize: Qt.size(control.icon.width, control.icon.height)

        fillMode: Image.PreserveAspectFit

        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter
        mipmap: true

        layer.enabled: content.coloredIcon
        layer.effect: MultiEffect {
            colorization: content.coloredIcon ? 1 : 0
            colorizationColor: content.textColor
        }
    }

    Text {
        id: txt

        font: control.font
        text: control.text

        Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

        color: content.textColor
    }

    Item {
        id: vertical
        visible: !content.inlineIcon
        anchors {
            centerIn: parent
        }

        Layout {
            anchors.fill: parent
            children: [img, txt]
        }
    }

    Item {
        id: horizontal
        visible: content.inlineIcon
        anchors {
            centerIn: parent
        }

        RowLayout {
            anchors.centerIn: parent
            children: [img, txt]
        }
    }
}
*/

