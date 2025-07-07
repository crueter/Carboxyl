import QtQuick 2.15

ComponentLoader {
    property string text

    // This is mildly convoluted, but i mean, it works
    // onTextChanged: item.text = text

    onLoaded: {
        item.text = text
    }

    Connections {
        target: item

        function onTextChanged() {
            text = item.text
        }
    }

    component: "Button"
}
