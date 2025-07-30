#include <QDirIterator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QSettings>
#include "settingsmanager.h"

#include <Carboxyl/Base/native/CarboxylApplication.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    app.setApplicationName("Demo");
    app.setOrganizationName("Carboxyl");

    CarboxylApplication *carboxyl = new CarboxylApplication(&engine, &app);
    engine.rootContext()->setContextProperty("CarboxylApplication", carboxyl);

    SettingsManager *manager = new SettingsManager(&app);
    engine.rootContext()->setContextProperty("Settings", manager);

    QString style = manager->get("style", "Trioxide").toString();
    if (style == "")
        style = "Trioxide";
    QQuickStyle::setStyle(QString("Carboxyl.Styles.%1").arg(style));

    carboxyl->setStyleName(style);

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    // QDirIterator iter(":/Demo/icons");
    // while (iter.hasNext()) {
    //     qDebug() << iter.next();
    // }

    engine.loadFromModule("Carboxyl", "Main");

    return app.exec();
}
