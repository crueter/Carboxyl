#!/bin/sh

SRC=$1
DEST=$2

for i in Graphide Helios Hydrogen Trioxide; do
    cp $i/$SRC.qml $i/$DEST.qml
    sed -i "/$SRC.qml/a $DEST.qml" $i/CMakeLists.txt
    sed -i "s/$SRC/$DEST/g" $i/$DEST.qml
done
