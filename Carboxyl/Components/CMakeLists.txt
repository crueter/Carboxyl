qt_add_library(CarboxylComponents STATIC)

qt_add_qml_module(CarboxylComponents
    URI Carboxyl.Components
    VERSION 0.1
    QML_FILES
        QML_FILES ComponentLoader.qml
        QML_FILES Button.qml
)
