# SPDX-FileCopyrightText: Copyright 2026 crueter
# SPDX-License-Identifier: LGPL-3.0-or-later

set_source_files_properties(Clover.qml
    PROPERTIES
    QT_QML_SINGLETON_TYPE true
)

CarboxylModule(
    NAME Clover
    URI Carboxyl.Clover
    QML_FILES
        CloverPalette.qml
        Clover.qml
        CloverAccent.qml
)

target_link_libraries(CarboxylClover PRIVATE Qt6::Quick)
