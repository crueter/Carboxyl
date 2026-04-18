# SPDX-FileCopyrightText: Copyright 2026 crueter
# SPDX-License-Identifier: LGPL-3.0-or-later

# compile defs
list(JOIN CARBOXYL_STYLES "\",\n\t\"" STYLES_DIRTY)
set(CARBOXYL_STYLES_LIST "\t\"${STYLES_DIRTY}\"")
list(LENGTH CARBOXYL_STYLES CARBOXYL_STYLES_LENGTH)

if (BUILD_SHARED_LIBS)
    set(LIB_TYPE SHARED)
else()
    set(LIB_TYPE STATIC)
endif()

add_subdirectory(Base)
add_subdirectory(Clover)
add_subdirectory(Contour)
add_subdirectory(Chroma)

if (CARBOXYL_DEMO)
    add_subdirectory(Demo)
endif()

if (CARBOXYL_INSTALL)
    include(GNUInstallDirs)

    install(TARGETS Carboxyl
        EXPORT CarboxylTargets
        BUNDLE DESTINATION .
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
    )

    install(EXPORT CarboxylTargets
        FILE CarboxylTargets.cmake
        NAMESPACE Carboxyl::
        DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/Carboxyl
    )

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
