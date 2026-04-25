# Dialog Icons

Contour uses a standard set of icons for its message dialogs, specifically: Warning, Critical, Information, Question. These are stored within the Carboxyl library itself as:

- `warning.svg`
- `critical.svg`
- `information.svg`
- `question.svg`

If you wish to supply your own icons, you must first tell Contour to use custom icons: `CarboxylApplication::setUseCustomIcons(true)` (this is accessible to QML as `CarboxylApplication.useCustomIcons = true`). Then, you must tell it the base directory to use; this can be local or done through QRC: `CarboxylApplication::setCustomIconDirectory("qrc:/qt/qml/MyProject")` (this is accessible to QML as `CarboxylApplication.customIconDirectory = "qrc:/qt/qml/MyProject"`.

Note that custom icon directories **must** contain all SVGs that Contour uses.
