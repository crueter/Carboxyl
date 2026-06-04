# Dialogs

Carboxyl provides several dialog compatibility layers mimicking traditional blocking Qt Widgets dialogs, such as `QFileDialog` and `QMessageBox`. These are implemented in Contour and interfaced via `CarboxylQuickInterface` (accessible via QML).

## Message Box

Equivalent to [`QMessageBox`](https://doc.qt.io/qt-6/qmessagebox.html)

Accessible via `CarboxylQuickInterface::showMessageBox`:

```cpp
<CarboxylQuickInterface>.showMessageBox(
    CarboxylEnums::Warning,
    tr("C++ Message Dialog"),
    tr("This is a QML message dialog created from C++."),
    QPlatformDialogHelper::StandardButtons::Ok);
```

QML can call this function as well:

```qml
CarboxylQuickInterface.showMessageBox(
    CarboxylEnums.Warning,
    qsTr("C++ Message Dialog"),
    qsTr("This is a QML message dialog created from C++."),
    DialogButtonBox.Ok)
```

## Progress Dialog

Equivalent to [`QProgressDialog`](https://doc.qt.io/qt-6/qprogressdialog.html)

Exposed as `CarboxylProgressDialog`:

```cpp
CarboxylProgressDialog *dialog = new CarboxylProgressDialog(this);
dialog->setLabelText(tr("Progress Dialog"));
dialog->setMinimum(0);
dialog->setMaximum(360);
dialog->setAutoClose(true);
dialog->show();

// ...
dialog->setValue(120);

// ...
dialog->close();

```

## File Dialog

Equivalent to [`QFileDialog`](https://doc.qt.io/qt-6/qfiledialog.html)

Accessible via `CarboxylQuickInterface`. Four methods are implemented:

- `getOpenFileName(title, dir, filter);`
- `getOpenFileNames(title, dir, filter)`
- `getSaveFileName(title, dir, filter)`
- `getExistingDirectory(caption, dir)`