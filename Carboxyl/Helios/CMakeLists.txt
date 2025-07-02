set_source_files_properties(Palettes.qml
    PROPERTIES
    QT_QML_SINGLETON_TYPE true
)

qt_add_library(CarboxylHelios STATIC)
qt_add_qml_module(CarboxylHelios
    VERSION 0.1
    URI Carboxyl.Helios
    QML_FILES
        Palettes.qml
)
