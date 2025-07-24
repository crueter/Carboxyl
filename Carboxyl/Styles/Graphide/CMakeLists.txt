qt_add_library(CarboxylGraphide STATIC)
qt_add_qml_module(CarboxylGraphide
    URI Carboxyl.Styles.Graphide
    VERSION 0.1
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
