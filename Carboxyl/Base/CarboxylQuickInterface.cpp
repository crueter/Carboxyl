// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

#include "CarboxylQuickInterface.h"
#include "CarboxylApplication.h"

#include <QQmlComponent>
#include <qnamespace.h>

CarboxylQuickInterface::CarboxylQuickInterface(QObject* parent) : QObject(parent) {}

QPlatformDialogHelper::StandardButton CarboxylQuickInterface::showMessageBox(
    CarboxylEnums::Icon icon, const QString& title, const QString& text,
    QPlatformDialogHelper::StandardButtons buttons, QObject* _) {
    const auto engine = g_carboxylApp->engine();

    QQmlComponent dialogComponent(engine, QUrl("qrc:/qt/qml/Carboxyl/Contour/MessageDialog.qml"),
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

    QMetaObject::invokeMethod(dialog, "show");

    loop.exec();

    dialog->deleteLater();
    return result;
}

void CarboxylQuickInterface::onButtonClicked(QQuickItem* button) {
    if (callback)
        callback(button);
}
