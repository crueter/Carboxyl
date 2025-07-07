#include "CarboxylApplication.h"
#include <QGuiApplication>
#include <QStyleHints>

CarboxylApplication::CarboxylApplication(QObject *parent)
    : QObject{parent}
{}

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

