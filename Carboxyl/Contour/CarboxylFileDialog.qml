// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later

import QtQuick
import QtQuick.Dialogs

Item {
    FileDialog {
        id: fileDialog
        objectName: "fileDialog"
    }

    FolderDialog {
        id: folderDialog
        objectName: "folderDialog"
    }
}
