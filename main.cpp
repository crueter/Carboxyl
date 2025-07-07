#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>

#include <Carboxyl/Base/native/CarboxylApplication.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    CarboxylApplication *carboxyl = new CarboxylApplication(&engine, &app);
    engine.rootContext()->setContextProperty("CarboxylApplication", carboxyl);

    char *cstyle = getenv("QT_QUICK_CONTROLS_STYLE");
    std::string style;

    if (!cstyle) {
        style = std::string{"Graphide"};
    } else {
        style = std::string{cstyle};
    }
    QQuickStyle::setStyle(QString("Carboxyl.Styles.%1").arg(style));

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("Carboxyl", "Main");

    return app.exec();
}
