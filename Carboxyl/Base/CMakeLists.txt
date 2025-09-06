# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

set_source_files_properties(Palettes.qml
    PROPERTIES
    QT_QML_SINGLETON_TYPE true
)

CarboxylModule(
    NAME Base
    URI Carboxyl.Base
    QML_FILES
        Accent.qml
        BasePalette.qml
        Palettes.qml
        TabButtonContent.qml
        Label.qml
        Dialog.qml
        DialogButtonBox.qml
        CarboxylTabButton.qml
        CarboxylTabBar.qml
)

target_sources(CarboxylBase PRIVATE
    native/CarboxylApplication.cpp
)

set_target_properties(CarboxylBase PROPERTIES
    PUBLIC_HEADER
    ${CMAKE_CURRENT_SOURCE_DIR}/native/CarboxylApplication.h
)

target_link_libraries(CarboxylBase
    PRIVATE
        Qt6::Gui
        Qt6::QuickControls2
)

