add_subdirectory(Helios)
add_subdirectory(Trioxide)
add_subdirectory(Hydrogen)
add_subdirectory(Graphide)

# CarboxylStyles is basically just a "utility" library that propagates all other styles
# to the target

if (BUILD_SHARED_LIBS)
    add_library(CarboxylStyles SHARED)
else()
    add_library(CarboxylStyles STATIC)
endif()


qt_add_qml_module(CarboxylStyles
    URI Carboxyl.Styles
    NO_PLUGIN
    VERSION 0.1
)

target_link_libraries(CarboxylStyles PRIVATE
    Carboxyl::Helios
    Carboxyl::Trioxide
    Carboxyl::Hydrogen
    Carboxyl::Graphide
)

add_library(Carboxyl::Styles ALIAS CarboxylStyles)
