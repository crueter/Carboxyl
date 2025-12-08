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

find_package(Qt6 REQUIRED COMPONENTS Core)

add_library(CarboxylBase ${LIB_TYPE}
    ${HEADERS}
    CarboxylConfig.cpp
    CarboxylApplication.cpp
    CarboxylQuickInterface.h CarboxylQuickInterface.cpp
    CarboxylProgressDialog.h CarboxylProgressDialog.cpp)

target_include_directories(CarboxylBase PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
    $<INSTALL_INTERFACE:include>
)

target_compile_definitions(CarboxylBase PRIVATE
    # Use QStringBuilder for string concatenation to reduce
    # the overall number of temporary strings created.
    QT_USE_QSTRINGBUILDER

    # Disable implicit conversions from/to C strings
    QT_NO_CAST_FROM_ASCII
    QT_NO_CAST_TO_ASCII

    # Disable implicit type narrowing in signal/slot connect() calls.
    QT_NO_NARROWING_CONVERSIONS_IN_CONNECT

    # Disable unsafe overloads of QProcess' start() function.
    QT_NO_PROCESS_COMBINED_ARGUMENT_START

    # Disable implicit QString->QUrl conversions to enforce use of proper resolving functions.
    QT_NO_URL_CAST_FROM_STRING
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

if (DEFINED Qt6Gui_PRIVATE_INCLUDE_DIRS)
    target_include_directories(CarboxylBase PUBLIC
        ${Qt6Gui_PRIVATE_INCLUDE_DIRS}
        ${Qt6QuickTemplates2_PRIVATE_INCLUDE_DIRS})
else()
    target_link_libraries(CarboxylBase PUBLIC Qt6::GuiPrivate Qt6::QuickTemplates2Private)
endif()

target_link_libraries(CarboxylBase
    PRIVATE
        Qt6::Gui
        Qt6::QuickControls2
        Qt6::Core
        Qt6::QuickTemplates2
)
target_link_libraries(CarboxylBase PRIVATE Qt6::Core)

target_link_libraries(Carboxyl INTERFACE CarboxylBase)
