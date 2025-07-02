qt_add_library(CarboxylBase STATIC)
qt_add_qml_module(CarboxylBase
    URI Carboxyl.Base
    VERSION 0.1
    QML_FILES
        Accent.qml
        BasePalette.qml
        LabeledTextField.qml
)
