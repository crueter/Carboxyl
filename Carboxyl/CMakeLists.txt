# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

# compile defs
list(JOIN CARBOXYL_STYLES "\",\n\t\"" STYLES_DIRTY)
set(CARBOXYL_STYLES_LIST "\t\"${STYLES_DIRTY}\"")
list(LENGTH CARBOXYL_STYLES CARBOXYL_STYLES_LENGTH)

add_subdirectory(Base)
add_subdirectory(Styles)

if (CARBOXYL_DEMO)
    add_subdirectory(Demo)
endif()

if (CARBOXYL_INSTALL)
    include(GNUInstallDirs)

    # you don't need to install the qml files because qrc is AWESOME
    include(CMakePackageConfigHelpers)
    configure_package_config_file(
        "${CMAKE_SOURCE_DIR}/CMakeModules/CarboxylConfig.cmake.in"
        "${CMAKE_BINARY_DIR}/CarboxylConfig.cmake"
        INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/Carboxyl
    )

    install(FILES "${CMAKE_BINARY_DIR}/CarboxylConfig.cmake" DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/Carboxyl)

    write_basic_package_version_file(
        "${CMAKE_BINARY_DIR}/CarboxylConfigVersion.cmake"
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion
    )

    install(FILES "${CMAKE_BINARY_DIR}/CarboxylConfigVersion.cmake" DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/Carboxyl)
endif()
