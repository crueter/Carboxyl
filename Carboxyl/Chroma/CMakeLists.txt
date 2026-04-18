# SPDX-FileCopyrightText: Copyright 2026 crueter
# SPDX-License-Identifier: LGPL-3.0-or-later

# CarboxylChroma is basically just a "utility" library that propagates all other styles
# to the target

add_library(CarboxylChroma INTERFACE)
add_library(Carboxyl::Chroma ALIAS CarboxylChroma)

foreach (STYLE ${CARBOXYL_STYLES})
    add_subdirectory(${STYLE})
    target_link_libraries(CarboxylChroma INTERFACE
        Carboxyl::${STYLE})
endforeach()
