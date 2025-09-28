// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

#include <QDirIterator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QSettings>
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
    QDirIterator iter(QDir(":/"), QDirIterator::Subdirectories);

    while (iter.hasNext()) {
        QString next = iter.next();
        if (!next.contains("k") && !next.contains("breeze")) {
            qDebug() << next;
        }
    }

    QObject::connect(
        engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine->loadFromModule("Demo", "Main");


    return app.exec();
}
