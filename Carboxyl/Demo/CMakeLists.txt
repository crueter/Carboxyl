# SPDX-FileCopyrightText: Copyright 2026 crueter
# SPDX-License-Identifier: LGPL-3.0-or-later

cmake_minimum_required(VERSION 3.16)

set(master_project OFF)
if(NOT DEFINED PROJECT_NAME)
    set(master_project ON)
endif()

project(CarboxylDemo VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

option(CARBOXYL_DEMO_ALWAYS_ACTIVE "Enable the always-active palette mode" OFF)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2 Gui Core)

if (master_project)
    find_package(Carboxyl REQUIRED)
endif()

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(CarboxylDemo
    main.cpp
    settingsmanager.h settingsmanager.cpp
    icons.qrc)

qt_add_qml_module(CarboxylDemo
    URI CarboxylDemo
    OUTPUT_DIRECTORY CarboxylDemoQml
    RESOURCE_PREFIX "/qt/qml"
    NO_PLUGIN
    VERSION 1.0
    QML_FILES
        Main.qml
        CustomThemes.qml)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(CarboxylDemo PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER org.carboxyl.demo
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE)

target_link_libraries(CarboxylDemo
    PRIVATE
    Carboxyl::Carboxyl
    Qt6::Gui
    Qt6::QuickControls2)

if (CARBOXYL_DEMO_ALWAYS_ACTIVE)
    target_compile_definitions(CarboxylDemo PRIVATE ALWAYS_ACTIVE=true)
else()
    target_compile_definitions(CarboxylDemo PRIVATE ALWAYS_ACTIVE=false)
endif()

include(GNUInstallDirs)
install(TARGETS CarboxylDemo
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
