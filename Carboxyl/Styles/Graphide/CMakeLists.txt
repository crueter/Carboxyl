if (BUILD_SHARED_LIBS)
    add_library(CarboxylGraphide SHARED)
else()
    add_library(CarboxylGraphide STATIC)
endif()

qt_add_qml_module(CarboxylGraphide
    URI Carboxyl.Styles.Graphide
    NO_PLUGIN
    VERSION 0.1
    QML_FILES
    Switch.qml
    Button.qml
    RoundButton.qml
    TabBar.qml
    TabButton.qml
    Slider.qml
    RangeSlider.qml
    Dial.qml
    ToolButton.qml
    TextField.qml
    ComboBox.qml
    CheckBox.qml
    RadioButton.qml
)

add_library(Carboxyl::Graphide ALIAS CarboxylGraphide)
