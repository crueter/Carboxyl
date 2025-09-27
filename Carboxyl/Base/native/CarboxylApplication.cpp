// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

#include "CarboxylApplication.h"
#include <QGuiApplication>
#include <QStyleHints>

#include <QPalette>
#include <QQuickStyle>
#include <qguiapplication.h>

CarboxylApplication::CarboxylApplication(QQmlApplicationEngine *engine, QObject *parent)
    : QObject{parent}
    , m_engine(engine)
{
    m_systemDarkMode = []() -> bool {
#if QT_VERSION >= QT_VERSION_CHECK(6, 5, 0)
        const auto scheme = QGuiApplication::styleHints()->colorScheme();
        return scheme == Qt::ColorScheme::Dark;
#else
        const QPalette defaultPalette;
        const auto text = defaultPalette.color(QPalette::WindowText);
        const auto window = defaultPalette.color(QPalette::Window);
        return text.lightness() > window.lightness();
#endif // QT_VERSION
    }();
}

QString CarboxylApplication::styleName()
{
    return m_styleName;
}

void CarboxylApplication::setStyleName(const QString &name)
{
    m_styleName = name;
}
