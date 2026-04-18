# SPDX-FileCopyrightText: Copyright 2026 crueter
# SPDX-License-Identifier: LGPL-3.0-or-later

CarboxylModule(
    NAME Contour
    URI Carboxyl.Contour
    QML_FILES
        TabButtonContent.qml
        Label.qml
        Dialog.qml
        DialogButtonBox.qml
        CarboxylTabButton.qml
        CarboxylTabBar.qml
        Ripple.qml

        NativeDialog.qml
        MessageDialog.qml
        ProgressDialog.qml

        AboutCarboxylDialog.qml

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
