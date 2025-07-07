import QtQuick

import Carboxyl.Base 0.1

Loader {
    required property string component

    id: loader

    source: `${Palettes.style}/${component}.qml`
}
