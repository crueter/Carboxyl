# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

if (BUILD_SHARED_LIBS)
    add_library(CarboxylHydrogenSHARED)
else()
    add_library(CarboxylHydrogenSTATIC)
endif()

qt_add_qml_module(CarboxylHydrogen
    VERSION 0.1
    URI Carboxyl.Styles.Hydrogen
    NO_PLUGIN
    QML_FILES
    Button.qml
    RoundButton.qml
    TabBar.qml
    TabButton.qml
    Slider.qml
    RangeSlider.qml
    Dial.qml
    ToolButton.qml
    TextField.qml
    ComboBox.qml
    CheckBox.qml
    Switch.qml
    RadioButton.qml
)

target_link_libraries(CarboxylHydrogen  PUBLIC Carboxyl::Base)

add_library(Carboxyl::Hydrogen ALIAS CarboxylHydrogen)
set_target_properties(CarboxylHydrogen PROPERTIES EXPORT_NAME "Hydrogen")
