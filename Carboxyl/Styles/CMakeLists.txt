# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

add_subdirectory(Helios)
add_subdirectory(Trioxide)
add_subdirectory(Hydrogen)

# FluentWinUI3 style is HORRID right now--wait for Qt to fix it
# add_subdirectory(Graphide)

# CarboxylStyles is basically just a "utility" library that propagates all other styles
# to the target

CarboxylModule(
    NAME Styles
    URI Carboxyl.Styles
)

target_link_libraries(CarboxylStyles PRIVATE
    Carboxyl::Helios
    Carboxyl::Trioxide
    Carboxyl::Hydrogen
    # Carboxyl::Graphide
)
