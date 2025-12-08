// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

#include <QDirIterator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QSettings>
#include "CarboxylProgressDialog.h"
#include "qpa/qplatformdialoghelper.h"
#include "settingsmanager.h"

#include "CarboxylApplication.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine *engine = new QQmlApplicationEngine(&app);

    app.setApplicationName("Demo");
    app.setOrganizationName("Carboxyl");

    SettingsManager *manager = new SettingsManager(&app);
    engine->rootContext()->setContextProperty("Settings", manager);

    QString style = manager->get("style", "").toString();

    // CarboxylApplication sets up the engine and a few other things
    CarboxylApplication *carboxylApp = new CarboxylApplication(app, engine, style, "Trioxide");

    // this is unnecessary, but gets clazy to shut up
    carboxylApp->setParent(&app);
    // QDirIterator iter(QDir(":/"), QDirIterator::Subdirectories);

    // while (iter.hasNext()) {
    //     QString next = iter.next();
    //     if (!next.contains("k") && !next.contains("breeze")) {
    //         qDebug() << next;
    //     }
    // }

    QObject::connect(
        engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine->loadFromModule("Demo", "Main");

    CarboxylProgressDialog* dialog = new CarboxylProgressDialog(engine);
    dialog->setLabelText(QObject::tr("Hello. Progress should be ~33%."));
    dialog->setTitle(QObject::tr("C++ Progress Dialog"));
    dialog->setValue(40);
    dialog->setMinimum(0);
    dialog->setMaximum(120);
    dialog->show();

    return app.exec();
}
