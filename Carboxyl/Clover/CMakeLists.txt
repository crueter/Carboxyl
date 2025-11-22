# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

set_source_files_properties(Palettes.qml
    PROPERTIES
    QT_QML_SINGLETON_TYPE true
)

# set(HEADERS
#     ${CMAKE_CURRENT_SOURCE_DIR}/native/CarboxylApplication.h
#     ${CMAKE_CURRENT_BINARY_DIR}/native/carboxyl_config.h
# )

CarboxylModule(
    NAME Clover
    URI Carboxyl.Clover
    QML_FILES
        Accent.qml
        BasePalette.qml
        Palettes.qml
)

# target_include_directories(CarboxylClover PUBLIC
#     $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
#     $<INSTALL_INTERFACE:include>

#     $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/native>
#     $<INSTALL_INTERFACE:include>
# )

# set_target_properties(CarboxylClover PROPERTIES
#     PUBLIC_HEADER "${HEADERS}"
# )

target_link_libraries(CarboxylClover
    PRIVATE
        Qt6::QuickControls2
)
