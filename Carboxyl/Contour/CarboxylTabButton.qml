// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick.Controls as C

C.TabButton {
    id: control
    property bool coloredIcon: false
    property bool inlineIcon: false

    property alias content: content

    contentItem: TabButtonContent {
        id: content
        control: control
    }
}
