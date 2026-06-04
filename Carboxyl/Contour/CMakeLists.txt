# SPDX-FileCopyrightText: Copyright 2026 crueter
# SPDX-License-Identifier: LGPL-3.0-or-later

CarboxylModule(
    NAME Contour
    URI Carboxyl.Contour
    QML_FILES
        TabButtonContent.qml
        Label.qml
        CarboxylDialog.qml
        DialogButtonBox.qml
        CarboxylTabButton.qml
        CarboxylTabBar.qml
        Ripple.qml

        CarboxylMessageDialog.qml
        CarboxylProgressDialog.qml

        AboutCarboxylDialog.qml
        CarboxylFileDialog.qml

        CarboxylLabeledSpinBox.qml
        FloatingPlaceholderText.qml
        CarboxylLabeledTextField.qml
        CarboxylLabeledComboBox.qml
        CarboxylLabeledDoubleSpinBox.qml
        DoubleSpinBox.qml
    RESOURCES
        icons/critical.svg
        icons/information.svg
        icons/question.svg
        icons/warning.svg
        icons/carboxyl.png)

target_link_libraries(CarboxylContour
    PRIVATE
        Qt6::Gui
        Qt6::QuickControls2)
