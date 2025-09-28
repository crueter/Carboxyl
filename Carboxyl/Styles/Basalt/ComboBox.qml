// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick
import QtQuick.Controls.Basic 6.4
import QtQuick.Controls.impl 6.4

import Carboxyl.Base

ComboBox {
    id: control

    indicator: ColorImage {
        x: control.mirrored ? control.padding : control.width - width - control.padding
        y: control.topPadding + (control.availableHeight - height) / 2
        color: control.palette.text
        defaultColor: "#353637"
        source: "qrc:/qt-project.org/imports/QtQuick/Controls/Basic/images/double-arrow.png"
        opacity: enabled ? 1 : 0.3
    }

    background {
        implicitWidth: 140
        implicitHeight: 35
    }
}
