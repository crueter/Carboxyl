#!/bin/sh

SRC=$1
DEST=$2

for i in Graphide Helios Hydrogen Trioxide; do
    mv $i/$SRC.qml $i/$DEST.qml
    sed -i "s/$SRC.qml/$DEST.qml/" $i/CMakeLists.txt
done
