qt_add_library(CarboxylTrioxide STATIC)
qt_add_qml_module(CarboxylTrioxide
    URI Carboxyl.Styles.Trioxide
    VERSION 0.1
    QML_FILES
        Button.qml
        TextField.qml
        ComboBox.qml
)
