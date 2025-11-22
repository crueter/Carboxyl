# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

configure_file(carboxyl_config.h.in carboxyl_config.h @ONLY)

set(HEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/CarboxylApplication.h
    ${CMAKE_CURRENT_SOURCE_DIR}/CarboxylConfig.h
    ${CMAKE_CURRENT_BINARY_DIR}/carboxyl_config.h
)

if (BUILD_SHARED_LIBS)
    set(LIB_TYPE SHARED)
else()
    set(LIB_TYPE STATIC)
endif()

set(LIB_NAME CarboxylBase)

add_library(CarboxylBase ${LIB_TYPE}
    ${HEADERS}
    CarboxylConfig.cpp
    CarboxylApplication.cpp)

target_include_directories(CarboxylBase PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>
)

set_target_properties(CarboxylBase PROPERTIES
    PUBLIC_HEADER "${HEADERS}"
)

add_library(Carboxyl::Base ALIAS CarboxylBase)

if (CARBOXYL_INSTALL)
    set_target_properties(CarboxylBase PROPERTIES
        EXPORT_NAME "Base")

    include(GNUInstallDirs)

    install(TARGETS CarboxylBase
        EXPORT BaseTargets
        BUNDLE DESTINATION .
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

    install(EXPORT BaseTargets
        FILE CarboxylBaseTargets.cmake
        NAMESPACE Carboxyl::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/Carboxyl)
endif()

target_link_libraries(CarboxylBase
    PRIVATE
        Qt6::Gui
        Qt6::QuickControls2
        Qt6::Core
)

target_link_libraries(Carboxyl INTERFACE CarboxylBase)
