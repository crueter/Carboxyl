set_source_files_properties(Palettes.qml
    PROPERTIES
    QT_QML_SINGLETON_TYPE true
)

find_package(Qt6 REQUIRED COMPONENTS Gui QuickControls2)

if (BUILD_SHARED_LIBS)
    set(LIB_TYPE SHARED)
else()
    set(LIB_TYPE STATIC)
endif()

add_library(CarboxylBase ${LIB_TYPE})

target_sources(CarboxylBase PUBLIC
    native/CarboxylApplication.cpp
)

set_target_properties(CarboxylBase PROPERTIES
    PUBLIC_HEADER
        ${CMAKE_CURRENT_SOURCE_DIR}/native/CarboxylApplication.h
)

target_link_libraries(CarboxylBase PRIVATE Qt6::Gui Qt6::QuickControls2)

qt_add_qml_module(CarboxylBase
    URI Carboxyl.Base
    VERSION 0.1
    NO_PLUGIN
    QML_FILES
        Accent.qml
        BasePalette.qml
        Palettes.qml
        TabButtonContent.qml
        Label.qml
        Dialog.qml
        DialogButtonBox.qml

        QML_FILES CarboxylTabButton.qml
        QML_FILES CarboxylTabBar.qml
)

# TODO
target_include_directories(CarboxylBase PUBLIC "native")

add_library(Carboxyl::Base ALIAS CarboxylBase)
