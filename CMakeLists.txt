# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

cmake_minimum_required(VERSION 3.16)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules")

if(DEFINED PROJECT_NAME)
    set(subproject ON)
    set(CARBOXYL_INSTALL_DEFAULT OFF)
else()
    set(subproject OFF)
    set(CARBOXYL_INSTALL_DEFAULT ON)
    set_property(GLOBAL PROPERTY USE_FOLDERS ON)
endif()

set(CARBOXYL_QML_VERSION "0.1" CACHE STRING "Exported QML version for Carboxyl to reference")

project(carboxyl VERSION ${CARBOXYL_QML_VERSION} LANGUAGES CXX)

set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2 Gui)
find_package(Qt6 REQUIRED COMPONENTS Core)

# TODO(crueter): This can technically run on <6.8 w/o graphide--or, maybe, just delete FluentWinUI3 out of existence and make my own. :)
qt_standard_project_setup(REQUIRES 6.8)

option(CARBOXYL_DEMO "Build the Carboxyl demo" ${subproject})
option(CARBOXYL_INSTALL "Install Carboxyl QML and libraries" ${CARBOXYL_INSTALL_DEFAULT})

include(CarboxylModule)

add_subdirectory(Carboxyl)
