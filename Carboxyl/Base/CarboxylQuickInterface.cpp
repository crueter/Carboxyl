// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later

#include "CarboxylQuickInterface.h"

#include <QEventLoop>
#include <QMetaObject>
#include <QQmlComponent>
#include <QQuickItem>
#include <QUrl>
#include <QVariant>

CarboxylQuickInterface::CarboxylQuickInterface(QQmlEngine* engine, QObject* parent)
    : QObject(parent), m_engine(engine) {}

void CarboxylQuickInterface::setWindow(QQuickWindow* window) {
    m_window = window;
}

QStringList convertFilters(const QString& filter) {
    if (filter.isEmpty())
        return QStringList();
    return filter.split(QStringLiteral(";;"));
}

QPlatformDialogHelper::StandardButton CarboxylQuickInterface::showMessageBox(
    CarboxylEnums::Icon icon, const QString& title, const QString& text,
    QPlatformDialogHelper::StandardButtons buttons, QObject* _) {

    QObject* dialog =
        initDialog(QStringLiteral("qrc:/qt/qml/Carboxyl/Contour/CarboxylMessageDialog.qml"));

    if (!dialog)
        return QPlatformDialogHelper::StandardButton::NoButton;

    dialog->setProperty("text", text);
    dialog->setProperty("title", title);
    dialog->setProperty("standardButtons", QVariant::fromValue(buttons));
    dialog->setProperty("icon", icon);

    QEventLoop loop;
    QPlatformDialogHelper::StandardButton result = QPlatformDialogHelper::NoButton;

    callback = [&](QQuickItem* val) mutable {
        QObject* obj = (QObject*)val;
        QQuickAbstractButton* button = (QQuickAbstractButton*)obj;
        result = standardButton(button);
        loop.quit();
    };

    QObject::connect(dialog, SIGNAL(buttonClicked(QQuickItem*)), this,
                     SLOT(onButtonClicked(QQuickItem*)));

    QMetaObject::invokeMethod(dialog, "open");
    loop.exec();

    dialog->deleteLater();
    return result;
}

// ========================
// ABOUT DIALOGS
// ========================

void CarboxylQuickInterface::aboutCarboxyl() {
    showAboutDialog(QStringLiteral("qrc:/qt/qml/Carboxyl/Contour/AboutCarboxylDialog.qml"));
}

void CarboxylQuickInterface::aboutQt() {
    showAboutDialog(QStringLiteral("qrc:/qt/qml/Carboxyl/Contour/AboutQtDialog.qml"));
}

// ========================
// FILE/FOLDER DIALOG STUFF
// ========================

const QString CarboxylQuickInterface::getOpenFileName(const QString& title, const QString& dir,
                                                      const QString& filter,
                                                      QString* selectedFilter) {
    QString result;
    execFileDialog(OpenFile, title, dir, filter, [&](QObject* dialog, bool accepted) {
        if (accepted && dialog)
            result = dialog->property("selectedFile").toUrl().toLocalFile();
    });
    return result;
}

const QStringList CarboxylQuickInterface::getOpenFileNames(const QString& title, const QString& dir,
                                                           const QString& filter,
                                                           QString* selectedFilter) {
    QStringList result;
    execFileDialog(OpenFiles, title, dir, filter, [&](QObject* dialog, bool accepted) {
        if (accepted && dialog) {
            const auto files = dialog->property("selectedFiles").value<QList<QUrl>>();
            for (const QUrl& url : files)
                result.append(url.toLocalFile());
        }
    });
    return result;
}

const QString CarboxylQuickInterface::getSaveFileName(const QString& title, const QString& dir,
                                                      const QString& filter,
                                                      QString* selectedFilter) {
    QString result;
    execFileDialog(SaveFile, title, dir, filter, [&](QObject* dialog, bool accepted) {
        if (accepted && dialog)
            result = dialog->property("selectedFile").toUrl().toLocalFile();
    });
    return result;
}

const QString CarboxylQuickInterface::getExistingDirectory(const QString& caption,
                                                           const QString& dir) {
    QString result;
    execGenericDialog(
        QStringLiteral("folderDialog"),
        [=](QObject* dialog) {
            dialog->setProperty("title", caption);
            dialog->setProperty("currentFolder", QUrl::fromLocalFile(dir));
        },
        [&](QObject* dialog, bool accepted) {
            if (accepted && dialog)
                result = dialog->property("selectedFolder").toUrl().toLocalFile();
        });
    return result;
}

void CarboxylQuickInterface::onButtonClicked(QQuickItem* button) {
    if (callback)
        callback(button);
}
void CarboxylQuickInterface::setAccepted() {
    m_accepted = true;
}

// ============
// HELPERS
// ============

QQuickItem* CarboxylQuickInterface::instantiateFileDialog() {
    QQmlComponent dialogComponent(
        m_engine, QUrl(QStringLiteral("qrc:/qt/qml/Carboxyl/Contour/CarboxylFileDialog.qml")),
        this);

    if (dialogComponent.isError()) {
        qWarning() << "Error instantiating CarboxylFileDialog:" << dialogComponent.errors();
        return nullptr;
    }

    QObject* dialog = dialogComponent.create();
    if (!dialog) {
        qWarning() << "Failed to create CarboxylFileDialog";
        return nullptr;
    }

    return qobject_cast<QQuickItem*>(dialog);
}

void CarboxylQuickInterface::execFileDialog(int fileMode, const QString& title, const QString& dir,
                                            const QString& filter,
                                            const std::function<void(QObject*, bool)>& done) {
    execGenericDialog(
        QStringLiteral("fileDialog"),
        [=](QObject* dialog) {
            dialog->setProperty("title", title);
            dialog->setProperty("currentFolder", QUrl::fromLocalFile(dir));
            dialog->setProperty("nameFilters", convertFilters(filter));
            dialog->setProperty("fileMode", fileMode);
        },
        done);
}

QObject* CarboxylQuickInterface::initDialog(const QString& path) {
    if (!m_window) {
        qWarning() << "CarboxylQuickInterface uninitialized during initDialog call";
        return nullptr;
    }

    QQmlComponent dialogComponent(m_engine, QUrl(path), this);

    if (dialogComponent.isError()) {
        qWarning() << "Error instantiating QML component from" << path;
        qWarning() << "QML engine returned error:" << dialogComponent.errorString();
        return nullptr;
    }

    QObject* dialog = dialogComponent.create();
    if (!dialog) {
        qWarning() << "Failed to create dialog from" << path;
        return nullptr;
    }

    dialog->setProperty("parent", QVariant::fromValue(m_window->contentItem()));
    return dialog;
}

void CarboxylQuickInterface::showAboutDialog(const QString& path) {
    QObject* dialog = initDialog(path);
    if (!dialog)
        return;

    QObject::connect(dialog, SIGNAL(aboutToHide()), dialog, SLOT(deleteLater()));

    QMetaObject::invokeMethod(dialog, "open");
}

void CarboxylQuickInterface::execGenericDialog(
    const QString& childName, std::function<void(QObject*)> setProps,
    const std::function<void(QObject*, bool)>& processResult) {
    if (!m_window) {
        qWarning() << "CarboxylQuickInterface uninitialized during execGenericDialog call";
        processResult(nullptr, false);
        return;
    }

    QQuickItem* dialogItem = qobject_cast<QQuickItem*>(
        initDialog(QStringLiteral("qrc:/qt/qml/Carboxyl/Contour/CarboxylFileDialog.qml")));

    if (!dialogItem) {
        processResult(nullptr, false);
        return;
    }

    QObject* dialog = dialogItem->findChild<QObject*>(childName);
    if (!dialog) {
        qWarning() << "Failed to find child object:" << childName;
        dialogItem->deleteLater();
        processResult(nullptr, false);
        return;
    }

    setProps(dialog);
    dialog->setProperty("parentWindow", QVariant::fromValue(m_window));

    QEventLoop loop;
    m_accepted = false;

    QObject::connect(dialog, SIGNAL(accepted()), &loop, SLOT(quit()));
    QObject::connect(dialog, SIGNAL(rejected()), &loop, SLOT(quit()));
    QObject::connect(dialog, SIGNAL(accepted()), this, SLOT(setAccepted()));

    QMetaObject::invokeMethod(dialog, "open");
    loop.exec();

    processResult(dialog, m_accepted);
    dialogItem->deleteLater();
}
