#include "CarboxylApplication.h"
#include <QGuiApplication>
#include <QStyleHints>

#include <QQuickStyle>

CarboxylApplication::CarboxylApplication(QQmlApplicationEngine *engine, QObject *parent)
    : QObject{parent}
    , m_engine(engine)
{
}

void CarboxylApplication::setDarkMode(bool dark)
{
    QStyleHints *hints = QGuiApplication::styleHints();
    hints->setColorScheme(dark ? Qt::ColorScheme::Dark : Qt::ColorScheme::Light);
}

bool CarboxylApplication::systemIsDarkMode()
{
    QStyleHints *hints = QGuiApplication::styleHints();
    return hints->colorScheme() == Qt::ColorScheme::Dark;
}
