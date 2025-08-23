if (BUILD_SHARED_LIBS)
    add_library(CarboxylTrioxide SHARED)
else()
    add_library(CarboxylTrioxide STATIC)
endif()

qt_add_qml_module(CarboxylTrioxide
    URI Carboxyl.Styles.Trioxide
    VERSION 0.1
    NO_PLUGIN
    QML_FILES
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
    Switch.qml
    RadioButton.qml

    RESOURCES
    images/check.svg
)

add_library(Carboxyl::Trioxide ALIAS CarboxylTrioxide)
set_target_properties(CarboxylTrioxide PROPERTIES EXPORT_NAME "Trioxide")
