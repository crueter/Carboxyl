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
            BUNDLE DESTINATION .
            LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
            RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
        )
    endforeach()

    # you don't need to install the qml files because qrc is AWESOME
endif()
