# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

cmake_minimum_required(VERSION 3.16)

function(CarboxylModule)
    set(oneValueArgs
        NAME
        URI)

    set(multiValueArgs
        QML_FILES
        SOURCES)

    cmake_parse_arguments(MODULE "" "${oneValueArgs}" "${multiValueArgs}"
                          "${ARGN}")

    if (BUILD_SHARED_LIBS)
        set(LIB_TYPE SHARED)
    else()
        set(LIB_TYPE STATIC)
    endif()

    set(LIB_NAME Carboxyl${MODULE_NAME})

    add_library(${LIB_NAME} ${LIB_TYPE})

    qt_add_qml_module(${LIB_NAME}
        URI ${MODULE_URI}
        VERSION ${CARBOXYL_QML_VERSION}
        OUTPUT_TARGETS TARGETS
        ${extra_args}

        QML_FILES ${MODULE_QML_FILES}
        SOURCES ${MODULE_SOURCES})

    add_library(Carboxyl::${MODULE_NAME} ALIAS ${LIB_NAME})
    target_link_libraries(${LIB_NAME} PUBLIC ${LIB_NAME}plugin)
    target_link_libraries(Carboxyl INTERFACE ${LIB_NAME} ${LIB_NAME}plugin)

    if (CARBOXYL_INSTALL)
        set_target_properties(${LIB_NAME} PROPERTIES
            EXPORT_NAME "${MODULE_NAME}")

        set_target_properties(${LIB_NAME}plugin PROPERTIES
            EXPORT_NAME "${MODULE_NAME}Plugin")

        include(GNUInstallDirs)

        install(TARGETS ${LIB_NAME} ${LIB_NAME}plugin ${TARGETS}
            EXPORT ${MODULE_NAME}Targets
            BUNDLE DESTINATION .
            LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
            PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})

        install(EXPORT ${MODULE_NAME}Targets
            FILE Carboxyl${MODULE_NAME}Targets.cmake
            NAMESPACE Carboxyl::
            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/Carboxyl)
    endif()
endfunction()
