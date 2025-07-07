add_subdirectory(Helios)
add_subdirectory(Trioxide)
add_subdirectory(Hydrogen)
add_subdirectory(Graphide)

qt_add_library(CarboxylStyles STATIC)

qt_add_qml_module(CarboxylStyles
    URI Carboxyl.Styles
    VERSION 0.1
)

target_link_libraries(CarboxylStyles PRIVATE
    CarboxylHeliosplugin
    CarboxylTrioxideplugin
    CarboxylHydrogenplugin
    CarboxylGraphideplugin
)
