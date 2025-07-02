import QtQuick
import QtQuick.Controls.Material

import org.eden_emu.constants
import org.eden_emu.items

TextField {
    property string suffix: ""

    placeholderTextColor: enabled && activeFocus ? Constants.accent : Qt.darker(
                                                       Constants.text, 1.3)

    color: enabled ? Constants.text : Qt.darker(Constants.text, 1.5)

    background: Rectangle {
        color: "transparent"
    }

    horizontalAlignment: "AlignHCenter"

    Text {
        id: txt
        text: suffix
        visible: suffix != ""

        font.pixelSize: 14 * Constants.scalar

        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right

            rightMargin: 5 * Constants.scalar
        }

        color: "gray"
    }
}
