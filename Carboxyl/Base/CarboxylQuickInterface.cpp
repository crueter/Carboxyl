// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later

#include "CarboxylQuickInterface.h"
#include "CarboxylApplication.h"

#include <QQmlComponent>
#include <QEventLoop>
#include <QMetaObject>
#include <QQuickItem>
#include <QUrl>
#include <QVariant>

CarboxylQuickInterface::CarboxylQuickInterface(QObject* parent) : QObject(parent) {}

// TODO: Split this file up

QStringList convertFilters(const QString& filter) {
    if (filter.isEmpty()) return QStringList();
    return filter.split(QStringLiteral(";;"));
}

QPlatformDialogHelper::StandardButton CarboxylQuickInterface::showMessageBox(
    CarboxylEnums::Icon icon, const QString& title, const QString& text,
    QPlatformDialogHelper::StandardButtons buttons, QObject* _) {
    const auto engine = g_carboxylApp->engine();

    QQmlComponent dialogComponent(engine, QUrl(QStringLiteral("qrc:/qt/qml/Carboxyl/Contour/CarboxylMessageDialog.qml")),
                                  this);

    if (dialogComponent.isError()) {
        qWarning() << "Error instantiating MessageDialog:" << dialogComponent.errors();
        return QPlatformDialogHelper::StandardButton::NoButton;
    }

    QObject* dialog = dialogComponent.create();
    if (!dialog) {
        qWarning() << "Failed to create MessageDialog";
        return QPlatformDialogHelper::StandardButton::NoButton;
    }

    QQuickItem *rootItem = g_carboxylApp->window()->contentItem();

    dialog->setProperty("parent", QVariant::fromValue(rootItem));

    dialog->setProperty("text", text);
    dialog->setProperty("title", title);
    dialog->setProperty("standardButtons", QVariant::fromValue(buttons));
    dialog->setProperty("icon", icon);

    QEventLoop loop;
    QPlatformDialogHelper::StandardButton result = QPlatformDialogHelper::NoButton;

    // this is horrible
    // blame Qt... maybe Qt 7 will make an API for this?
    callback = [&](QQuickItem* val) mutable {
        QObject* obj = (QObject *)val;
        QQuickAbstractButton* button = (QQuickAbstractButton*)obj;
        result = standardButton(button);
        loop.quit();
    };

    QObject::connect(dialog, SIGNAL(buttonClicked(QQuickItem*)),
                     this, SLOT(onButtonClicked(QQuickItem*)));

    QMetaObject::invokeMethod(dialog, "open");

    loop.exec();

    dialog->deleteLater();
    return result;
}

// TODO: These share a bunch of code.
void CarboxylQuickInterface::aboutQt() {
    const auto engine = g_carboxylApp->engine();

    QQmlComponent dialogComponent(engine, QUrl(QStringLiteral("qrc:/qt/qml/Carboxyl/Contour/AboutQtDialog.qml")),
                                  this);

    if (dialogComponent.isError()) {
        qWarning() << "Error instantiating AboutQtDialog:" << dialogComponent.errors();
        return;
    }

    QObject* dialog = dialogComponent.create();
    if (!dialog) {
        qWarning() << "Failed to create AboutQtDialog";
        return;
    }

    QQuickItem *rootItem = g_carboxylApp->window()->contentItem();
    dialog->setProperty("parent", QVariant::fromValue(rootItem));

    QObject::connect(dialog, SIGNAL(aboutToHide()),
                     dialog, SLOT(deleteLater()));

    QMetaObject::invokeMethod(dialog, "open");
}

void CarboxylQuickInterface::aboutCarboxyl() {
    const auto engine = g_carboxylApp->engine();

    QQmlComponent dialogComponent(engine, QUrl(QStringLiteral("qrc:/qt/qml/Carboxyl/Contour/AboutCarboxylDialog.qml")),
                                  this);

    if (dialogComponent.isError()) {
        qWarning() << "Error instantiating AboutCarboxylDialog:" << dialogComponent.errors();
        return;
    }

    QObject* dialog = dialogComponent.create();
    if (!dialog) {
        qWarning() << "Failed to create AboutCarboxylDialog";
        return;
    }

    QQuickItem *rootItem = g_carboxylApp->window()->contentItem();
    dialog->setProperty("parent", QVariant::fromValue(rootItem));

    QObject::connect(dialog, SIGNAL(aboutToHide()),
                     dialog, SLOT(deleteLater()));

    QMetaObject::invokeMethod(dialog, "open");
}

// ========================
// FILE/FOLDER DIALOG STUFF
// ========================

QQuickItem *CarboxylQuickInterface::instantiateFileDialog() {
    const auto engine = g_carboxylApp->engine();

    QQmlComponent dialogComponent(engine, QUrl(QStringLiteral("qrc:/qt/qml/Carboxyl/Contour/CarboxylFileDialog.qml")),
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

    return qobject_cast<QQuickItem *>(dialog);
}

void CarboxylQuickInterface::execFileDialog(int fileMode,
                                            const QString& title, const QString& dir,
                                            const QString& filter,
                                            const std::function<void(QObject*, bool)>& done) {
    QQuickItem *dialogItem = instantiateFileDialog();
    if (!dialogItem) { done(nullptr, false); return; }
    QObject *dialog = dialogItem->findChild<QObject*>("fileDialog");
    if (!dialog) {
        dialogItem->deleteLater();
        done(nullptr, false);
        return;
    }

    dialog->setProperty("title", title);
    dialog->setProperty("currentFolder", QUrl::fromLocalFile(dir));
    dialog->setProperty("nameFilters", convertFilters(filter));
    dialog->setProperty("parentWindow", QVariant::fromValue(g_carboxylApp->window()));
    dialog->setProperty("fileMode", fileMode);

    QEventLoop loop;
    m_accepted = false;

    QObject::connect(dialog, SIGNAL(accepted()), &loop, SLOT(quit()));
    QObject::connect(dialog, SIGNAL(rejected()), &loop, SLOT(quit()));
    QObject::connect(dialog, SIGNAL(accepted()), this, SLOT(setAccepted()));

    QMetaObject::invokeMethod(dialog, "open");
    loop.exec();

    done(dialog, m_accepted);
    dialogItem->deleteLater();
}

const QString CarboxylQuickInterface::getOpenFileName(const QString& title, const QString& dir,
                                                       const QString& filter,
                                                       QString* selectedFilter) {
    QString result;
    execFileDialog(OpenFile, title, dir, filter, [&](QObject *dialog, bool accepted) {
        if (accepted)
            result = dialog->property("selectedFile").toUrl().toLocalFile();
    });
    return result;
}

const QStringList CarboxylQuickInterface::getOpenFileNames(const QString& title, const QString& dir,
                                                           const QString& filter,
                                                           QString* selectedFilter) {
    QStringList result;
    execFileDialog(OpenFiles, title, dir, filter, [&](QObject *dialog, bool accepted) {
        if (accepted) {
            const auto files = dialog->property("selectedFiles").value<QList<QUrl>>();
            for (const QUrl &url : files)
                result.append(url.toLocalFile());
        }
    });
    return result;
}

const QString CarboxylQuickInterface::getSaveFileName(const QString& title, const QString& dir,
                                                      const QString& filter,
                                                      QString* selectedFilter) {
    QString result;
    execFileDialog(SaveFile, title, dir, filter, [&](QObject *dialog, bool accepted) {
        if (accepted)
            result = dialog->property("selectedFile").toUrl().toLocalFile();
    });
    return result;
}

const QString CarboxylQuickInterface::getExistingDirectory(const QString& caption,
                                                           const QString& dir) {
    QQuickItem *dialogItem = instantiateFileDialog();
    if (!dialogItem) return QString();
    QObject *dialog = dialogItem->findChild<QObject*>("folderDialog");
    if (!dialog) {
        dialogItem->deleteLater();
        return QString();
    }

    dialog->setProperty("title", caption);
    dialog->setProperty("currentFolder", QUrl::fromLocalFile(dir));
    dialog->setProperty("parentWindow", QVariant::fromValue(g_carboxylApp->window()));

    QEventLoop loop;
    m_accepted = false;

    QObject::connect(dialog, SIGNAL(accepted()), &loop, SLOT(quit()));
    QObject::connect(dialog, SIGNAL(rejected()), &loop, SLOT(quit()));
    QObject::connect(dialog, SIGNAL(accepted()), this, SLOT(setAccepted()));

    QMetaObject::invokeMethod(dialog, "open");
    loop.exec();

    QString result;
    if (m_accepted)
        result = dialog->property("selectedFolder").toUrl().toLocalFile();

    dialogItem->deleteLater();
    return result;
}

void CarboxylQuickInterface::onButtonClicked(QQuickItem* button) {
    if (callback)
        callback(button);
}

void CarboxylQuickInterface::setAccepted() {
    m_accepted = true;
}
