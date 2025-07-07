set_source_files_properties(Palettes.qml
    PROPERTIES
    QT_QML_SINGLETON_TYPE true
)

find_package(Qt6 REQUIRED COMPONENTS Core)
find_package(Qt6 REQUIRED COMPONENTS Gui)

qt_add_library(CarboxylBase STATIC)

target_link_libraries(CarboxylBase PRIVATE Qt6::Core)
target_link_libraries(CarboxylBase PRIVATE Qt6::Gui)

qt_add_qml_module(CarboxylBase
    URI Carboxyl.Base
    VERSION 0.1
    QML_FILES
        Accent.qml
        BasePalette.qml
        Palettes.qml
        LabeledTextField.qml
        SOURCES native/CarboxylApplication.h native/CarboxylApplication.cpp
)

target_include_directories(CarboxylBase PRIVATE "native")
