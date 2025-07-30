set_source_files_properties(Palettes.qml
    PROPERTIES
    QT_QML_SINGLETON_TYPE true
)

find_package(Qt6 REQUIRED COMPONENTS Gui QuickControls2)

qt_add_library(CarboxylBase STATIC)

target_link_libraries(CarboxylBase PRIVATE Qt6::Gui Qt6::QuickControls2)

qt_add_qml_module(CarboxylBase
    URI Carboxyl.Base
    VERSION 0.1
    QML_FILES
        Accent.qml
        BasePalette.qml
        Palettes.qml

        SOURCES native/CarboxylApplication.h native/CarboxylApplication.cpp
        QML_FILES
        QML_FILES
        QML_FILES TabButtonContent.qml
)

target_include_directories(CarboxylBase PRIVATE "native")
