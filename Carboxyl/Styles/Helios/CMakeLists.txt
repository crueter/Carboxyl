qt_add_library(CarboxylHelios STATIC)
qt_add_qml_module(CarboxylHelios
    VERSION 0.1
    URI Carboxyl.Styles.Helios
    QML_FILES
    Switch.qml
    Button.qml
    RoundButton.qml
Slider.qml
RangeSlider.qml
Dial.qml
ToolButton.qml
    TextField.qml
    ComboBox.qml
    CheckBox.qml
    RadioButton.qml
)
