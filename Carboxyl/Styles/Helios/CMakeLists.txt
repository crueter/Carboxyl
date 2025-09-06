# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

if (BUILD_SHARED_LIBS)
    add_library(CarboxylHelios SHARED)
else()
    add_library(CarboxylHelios STATIC)
endif()

qt_add_qml_module(CarboxylHelios
    VERSION 0.1
    URI Carboxyl.Styles.Helios
    NO_PLUGIN
    QML_FILES
    Switch.qml
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
    RadioButton.qml
)

target_link_libraries(CarboxylHelios PUBLIC Carboxyl::Base)

add_library(Carboxyl::Helios ALIAS CarboxylHelios)
set_target_properties(CarboxylHelios PROPERTIES EXPORT_NAME "Helios")
