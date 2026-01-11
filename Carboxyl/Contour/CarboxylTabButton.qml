// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later
import QtQuick.Controls as C

C.TabButton {
    id: control
    property bool inlineIcon: false
    property bool coloredIcon: false

    property alias content: content

    contentItem: TabButtonContent {
        id: content
        control: control
    }
}
