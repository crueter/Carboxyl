// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick

QtObject {
    required property string name

    required property color active
    required property color inactive
    property color disabled: inactive
}
