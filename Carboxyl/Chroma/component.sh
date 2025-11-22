#!/bin/sh

# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

SRC=$1
DEST=$2

for i in Graphide Helios Hydrogen Basalt Trioxide; do
    cp $i/$SRC.qml $i/$DEST.qml
    sed -i "/$SRC.qml/a $DEST.qml" $i/CMakeLists.txt
    sed -i "s/$SRC/$DEST/g" $i/$DEST.qml
done
