# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

cmake_minimum_required(VERSION 3.16)

if(DEFINED PROJECT_NAME)
    set(subproject ON)
    set(CARBOXYL_INSTALL_DEFAULT OFF)
else()
    set(subproject OFF)
    set(CARBOXYL_INSTALL_DEFAULT ON)
    set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endif()

project(carboxyl VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2 Gui)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup(REQUIRES 6.8)

option(CARBOXYL_DEMO "Build the Carboxyl demo" ${subproject})
option(CARBOXYL_INSTALL "Install Carboxyl QML and libraries" ${CARBOXYL_INSTALL_DEFAULT})
set(CARBOXYL_QML_SUFFIX "qt6/qml" CACHE STRING "Where to install the QML files (subdirectory of the default libdir)")

add_subdirectory(Carboxyl)
