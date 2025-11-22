// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

#include "CarboxylApplication.h"

// Some OSes lack good hwaccel support
#if !defined(__linux__) && !defined(__APPLE__) && !defined(_WIN32) && !defined(__FreeBSD__)
#define NEED_SWRAST
#include <QQuickWindow>
#include <QSGRendererInterface>
#endif

CarboxylApplication::CarboxylApplication(QGuiApplication &app,
                                         QQmlApplicationEngine *engine,
                                         const QString &style,
                                         const QString &defaultStyle)
    : QObject(&app)
    , m_engine(engine)
    , m_config(new CarboxylConfig(this))
    , m_defaultStyle(defaultStyle)
{
#ifdef NEED_SWRAST
    QQuickWindow::setGraphicsApi(QSGRendererInterface::Software);
#endif
    // system dark mode check
    m_systemDarkMode = [&app]() -> bool {
#if QT_VERSION >= QT_VERSION_CHECK(6, 5, 0)
        const auto scheme = app.styleHints()->colorScheme();
        return scheme == Qt::ColorScheme::Dark;
#else
        const QPalette defaultPalette;
        const auto text = defaultPalette.color(QPalette::WindowText);
        const auto window = defaultPalette.color(QPalette::Window);
        return text.lightness() > window.lightness();
#endif // QT_VERSION
    }();

    //  style
    QString use_style = style;
    if (use_style == "")
        use_style = m_defaultStyle;
    QQuickStyle::setStyle(QString("Carboxyl.Chroma.%1").arg(use_style));
    setStyleName(style);

    // init dependents
    CarboxylConfig *config = new CarboxylConfig(this);

    // ctx setup
    engine->rootContext()->setContextProperty("CarboxylApplication", this);
    engine->rootContext()->setContextProperty("CarboxylConfig", config);
}

QString CarboxylApplication::styleName()
{
    return m_styleName;
}

void CarboxylApplication::setStyleName(const QString &style)
{
    m_styleName = style;
}
