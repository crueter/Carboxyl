# SPDX-FileCopyrightText: Copyright 2025 crueter
# SPDX-License-Identifier: GPL-3.0-or-later

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
        CarboxylLabeledSpinBox.qml
        FloatingPlaceholderText.qml
        CarboxylLabeledTextField.qml
        CarboxylLabeledComboBox.qml
        CarboxylLabeledDoubleSpinBox.qml
        DoubleSpinBox.qml
)

target_link_libraries(CarboxylContour
    PRIVATE
        Qt6::Gui
        Qt6::QuickControls2
)
