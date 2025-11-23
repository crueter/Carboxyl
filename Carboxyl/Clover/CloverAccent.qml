// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later
import QtQuick


/**
  Defines active, inactive, disabled for each accent.
  */
QtObject {
    /// If true, the dependent colors will be made lighter, NOT darker.
    // property bool dark: false
    required property string name

    property color light
    property color dark: Qt.lighter(light, 1.1)
    property color midnight: Qt.lighter(light, 1.2)
}
