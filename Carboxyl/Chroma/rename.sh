#!/bin/sh

# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

SRC=$1
DEST=$2

for i in Graphide Helios Hydrogen Trioxide; do
    mv $i/$SRC.qml $i/$DEST.qml
    sed -i "s/$SRC.qml/$DEST.qml/" $i/CMakeLists.txt
done
