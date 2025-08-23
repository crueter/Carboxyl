add_subdirectory(Base)
add_subdirectory(Styles)

if (CARBOXYL_DEMO)
    add_subdirectory(Demo)
endif()

if (CARBOXYL_INSTALL)
    include(GNUInstallDirs)

    # Install targets
    foreach(LIB Helios Graphide Hydrogen Trioxide Base Styles)
        install(TARGETS Carboxyl${LIB}
            EXPORT ${LIB}Targets
            BUNDLE DESTINATION .
            LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
            PUBLIC_HEADER DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
        )

        install(EXPORT ${LIB}Targets
            FILE Carboxyl${LIB}Targets.cmake
            NAMESPACE Carboxyl::
            DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/Carboxyl
        )
    endforeach()

    # you don't need to install the qml files because qrc is AWESOME
    include(CMakePackageConfigHelpers)
    configure_package_config_file(
        "${CMAKE_SOURCE_DIR}/cmake/CarboxylConfig.cmake.in"
        "${CMAKE_BINARY_DIR}/CarboxylConfig.cmake"
        INSTALL_DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/Carboxyl
    )

install(FILES "${CMAKE_BINARY_DIR}/CarboxylConfig.cmake" DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/Carboxyl)

    write_basic_package_version_file(
        "${CMAKE_CURRENT_BINARY_DIR}/CarboxylConfigVersion.cmake"
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion
    )

endif()
