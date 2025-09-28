# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

# CarboxylStyles is basically just a "utility" library that propagates all other styles
# to the target

CarboxylModule(
    NAME Styles
    URI Carboxyl.Styles
)

foreach (STYLE ${CARBOXYL_STYLES})
    add_subdirectory(${STYLE})
    target_link_libraries(CarboxylStyles PRIVATE
        Carboxyl::${STYLE}
    )
endforeach()
