cmake_minimum_required(VERSION 3.16)

function(CarboxylModule)
    set(oneValueArgs
        NAME
        URI
    )

    cmake_parse_arguments(MODULE "" "${oneValueArgs}" ""
                          "${ARGN}")

    if (BUILD_SHARED_LIBS)
        set(LIB_TYPE SHARED)
    else()
        set(LIB_TYPE STATIC)
    endif()

    set(LIB_NAME Carboxyl${MODULE_NAME})

    add_library(${LIB_NAME} ${LIB_TYPE})

    qt_add_qml_module(${LIB_NAME}
        URI ${MODULE_URI}
        NO_PLUGIN
        VERSION ${CARBOXYL_QML_VERSION}
        OUTPUT_TARGETS TARGETS

        ${MODULE_UNPARSED_ARGUMENTS}
    )

    set_target_properties(${LIB_NAME} PROPERTIES
        EXPORT_NAME "${MODULE_NAME}")

    set_property(TARGET ${LIB_NAME} PROPERTY RESOURCE_TARGETS "${TARGETS}")

    add_library(Carboxyl::${MODULE_NAME} ALIAS ${LIB_NAME})
endfunction()
