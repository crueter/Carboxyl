// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later

#pragma once

#include <QObject>
#include <QQmlEngine>

#include <qpa/qplatformdialoghelper.h>
#include <private/qquickabstractbutton_p.h>
#include <private/qquickdialogbuttonbox_p.h>
#include <private/qquickdialogbuttonbox_p_p.h>

namespace CarboxylEnums {
    Q_NAMESPACE

enum Icon {
    // keep this in sync with QMessageDialogOptions::StandardIcon
    NoIcon = 0,
    Information = 1,
    Warning = 2,
    Critical = 3,
    Question = 4
};

Q_ENUM_NS(Icon)

}

class CarboxylQuickInterface : public QObject {
    Q_OBJECT

public:
    CarboxylQuickInterface(QObject* parent = nullptr);

    enum FileMode : int {
        OpenFile,
        OpenFiles,
        SaveFile
    };
    Q_ENUM(FileMode)

    // Qt does not expose an API within QQuickDialogButtonBox that lets us query the StandardButton
    // pressed during a click. To get around this, we have to do this horrible hack.
    inline QPlatformDialogHelper::StandardButton standardButton(QQuickAbstractButton *button) const {
        QQuickDialogButtonBoxAttached *attached = qobject_cast<QQuickDialogButtonBoxAttached *>(qmlAttachedPropertiesObject<QQuickDialogButtonBox>(button, false));
        if (attached)
            return QQuickDialogButtonBoxAttachedPrivate::get(attached)->standardButton;
        else
            return QPlatformDialogHelper::NoButton;
    }

    Q_INVOKABLE void aboutQt();

    Q_INVOKABLE QPlatformDialogHelper::StandardButton showMessageBox(
        CarboxylEnums::Icon icon, const QString& title, const QString& text,
        QPlatformDialogHelper::StandardButtons buttons, QObject* parent = nullptr);

    Q_INVOKABLE void aboutCarboxyl();

    Q_INVOKABLE const QString getOpenFileName(const QString& title, const QString& dir = QString(), const QString& filter = QString(),
                                  QString* selectedFilter = nullptr);

    Q_INVOKABLE const QStringList getOpenFileNames(const QString& title, const QString& dir = QString(), const QString& filter = QString(),
                                       QString* selectedFilter = nullptr);

    Q_INVOKABLE const QString getSaveFileName(const QString& title, const QString& dir = QString(), const QString& filter = QString(),
                                  QString* selectedFilter = nullptr);

    Q_INVOKABLE const QString getExistingDirectory(const QString& caption = QString(), const QString& dir = QString());

public slots:
    void onButtonClicked(QQuickItem* button);

private slots:
    void setAccepted();

private:
    std::function<void(QQuickItem* )> callback;
    QQuickItem* instantiateFileDialog();
    void execFileDialog(int fileMode, const QString& title, const QString& dir,
                        const QString& filter,
                        const std::function<void(QObject*, bool)>& done);

    bool m_accepted = false;
};
