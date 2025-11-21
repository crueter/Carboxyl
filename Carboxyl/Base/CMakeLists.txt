# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

set_source_files_properties(Palettes.qml
    PROPERTIES
    QT_QML_SINGLETON_TYPE true
)

configure_file(native/carboxyl_config.h.in native/carboxyl_config.h @ONLY)

set(HEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/native/CarboxylApplication.h
    ${CMAKE_CURRENT_BINARY_DIR}/native/carboxyl_config.h
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
        Ripple.qml
        NativeDialog.qml
        CarboxylLabeledSpinBox.qml
        FloatingPlaceholderText.qml
        CarboxylLabeledTextField.qml
        CarboxylLabeledComboBox.qml
    SOURCES
        ${HEADERS}
        native/CarboxylConfig.h native/CarboxylConfig.cpp
        native/CarboxylApplication.cpp
)

target_sources(CarboxylBase
  PRIVATE
)

target_include_directories(CarboxylBase PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
    $<INSTALL_INTERFACE:include>

    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/native>
    $<INSTALL_INTERFACE:include>
)

set_target_properties(CarboxylBase PROPERTIES
    PUBLIC_HEADER "${HEADERS}"
)

target_link_libraries(CarboxylBase
    PRIVATE
        Qt6::Gui
        Qt6::QuickControls2
        Qt6::Core
)
