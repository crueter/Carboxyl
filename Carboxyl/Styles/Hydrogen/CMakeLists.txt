qt_add_library(CarboxylHydrogen STATIC)
qt_add_qml_module(CarboxylHydrogen
    VERSION 0.1
    URI Carboxyl.Styles.Hydrogen
    QML_FILES
        Button.qml
        TextField.qml
        ComboBox.qml

)
