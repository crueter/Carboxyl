cmake_minimum_required(VERSION 3.16)

project(carboxyl VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick QuickControls2 Gui)
find_package(Qt6 REQUIRED COMPONENTS Core)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(Carboxyl
    main.cpp
    icons.qrc
)

set_target_properties(Carboxyl
    PROPERTIES
    OUTPUT_NAME carboxyl_demo)

add_subdirectory(../Carboxyl ${CMAKE_BINARY_DIR}/Carboxyl)
target_include_directories(Carboxyl PRIVATE ..)

qt_add_qml_module(Carboxyl
    URI Carboxyl
    OUTPUT_DIRECTORY Carboxyl_QML
    VERSION 1.0
    QML_FILES
        Main.qml
        SOURCES settingsmanager.h settingsmanager.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(Carboxyl PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appcarboxyl
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(Carboxyl
    PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
    Qt6::Gui
    CarboxylBaseplugin
    CarboxylStylesplugin
)
target_link_libraries(Carboxyl PRIVATE Qt6::Core)

include(GNUInstallDirs)
install(TARGETS Carboxyl
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
