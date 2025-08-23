set_source_files_properties(Palettes.qml
    PROPERTIES
    QT_QML_SINGLETON_TYPE true
)

find_package(Qt6 REQUIRED COMPONENTS Gui QuickControls2)

if (BUILD_SHARED_LIBS)
    add_library(CarboxylBase SHARED)
else()
    add_library(CarboxylBase STATIC)
endif()

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

        SOURCES native/CarboxylApplication.h native/CarboxylApplication.cpp
        QML_FILES CarboxylTabButton.qml
        QML_FILES CarboxylTabBar.qml
)

# TODO
target_include_directories(CarboxylBase PUBLIC "native")

add_library(Carboxyl::Base ALIAS CarboxylBase)
