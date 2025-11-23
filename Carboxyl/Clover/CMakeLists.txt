# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

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

target_link_libraries(CarboxylClover PRIVATE Qt6::Quick
)

if (DEFINED Qt6Quick_PRIVATE_INCLUDE_DIRS)
    target_include_directories(CarboxylClover PUBLIC ${Qt6Quick_PRIVATE_INCLUDE_DIRS})
else()
    target_link_libraries(CarboxylClover PUBLIC Qt6::QuickPrivate)
endif()
