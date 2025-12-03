# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

# proj setup
cmake_minimum_required(VERSION 3.16)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules")

if(DEFINED PROJECT_NAME)
    set(CARBOXYL_INSTALL_DEFAULT OFF)
else()
    set(CARBOXYL_INSTALL_DEFAULT ON)
    set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endif()

set(CARBOXYL_QML_VERSION "0.1" CACHE STRING "Exported QML version for Carboxyl to reference")

project(carboxyl VERSION ${CARBOXYL_QML_VERSION} LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# qt
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED
    COMPONENTS Core Quick QuickControls2 Gui QuickTemplates2
    OPTIONAL_COMPONENTS GuiPrivate QuickTemplates2Private)

qt_standard_project_setup(REQUIRES 6.4)

if(QT_KNOWN_POLICY_QTP0001)
    qt_policy(SET QTP0001 NEW)
endif()

# meta lib to link to everything
add_library(Carboxyl INTERFACE)
add_library(Carboxyl::Carboxyl ALIAS Carboxyl)

# options
set(CARBOXYL_STYLES "Basalt;Helios;Hydrogen;Trioxide;Graphide" CACHE STRING "Styles to build")
set_property(CACHE CARBOXYL_STYLES PROPERTY STRINGS Basalt Helios Hydrogen Trioxide Graphide)

option(CARBOXYL_DEMO "Build the Carboxyl demo" ${CARBOXYL_INSTALL_DEFAULT})
option(CARBOXYL_INSTALL "Install Carboxyl QML and libraries" ${CARBOXYL_INSTALL_DEFAULT})

include(CarboxylModule)

add_subdirectory(Carboxyl)
