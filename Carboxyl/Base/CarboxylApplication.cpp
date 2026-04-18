// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later

#include "CarboxylApplication.h"
#include "CarboxylConfig.h"
#include "CarboxylQuickInterface.h"

#include <QQuickStyle>

#if QT_VERSION >= QT_VERSION_CHECK(6, 5, 0)
#include <QStyleHints>
#else
#include <QPalette>
#endif

CarboxylApplication* g_carboxylApp = nullptr;

// Windows dark mode stuff
#ifdef _WIN32
#include <dwmapi.h>
#include <windows.h>

// nice
#undef interface

#ifdef _MSC_VER
#pragma comment(lib, "Dwmapi.lib")
#endif

#endif

// Some OSes lack good hwaccel support
#if !defined(__linux__) && !defined(__APPLE__) && !defined(_WIN32) && !defined(__FreeBSD__)
#define NEED_SWRAST
#include <QSGRendererInterface>
#endif

CarboxylApplication::CarboxylApplication(QGuiApplication& app, QQmlApplicationEngine* engine,
                                         const QString& style, const QString& defaultStyle,
                                         const bool alwaysActive)
    : QObject(&app), m_engine(engine), m_config(new CarboxylConfig(this)),
      m_interface(new CarboxylQuickInterface(engine)), m_defaultStyle(defaultStyle) {
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
    if (use_style == QString())
        use_style = m_defaultStyle;

    QQuickStyle::setStyle(QStringLiteral("Carboxyl.Chroma.%1").arg(use_style));
    setStyleName(style);

    // init dependents
    m_config = new CarboxylConfig(this);

    // ctx setup
    engine->rootContext()->setContextProperty(QStringLiteral("CarboxylApplication"), this);
    engine->rootContext()->setContextProperty(QStringLiteral("CarboxylConfig"), m_config);
    engine->rootContext()->setContextProperty(QStringLiteral("CarboxylQuickInterface"), m_interface);
    engine->rootContext()->setContextProperty(QStringLiteral("CarboxylAlwaysActive"), alwaysActive);

    // enum setup
    qmlRegisterUncreatableMetaObject(
        CarboxylEnums::staticMetaObject,
        "Carboxyl.Contour",
        0, 1,
        "CarboxylEnums",
        tr("Error: attempted to instantiate namespace CarboxylEnums")
    );

    // objectCreated is only called when the root object is finished
    connect(engine, &QQmlApplicationEngine::objectCreated, this, [this](QObject *object, QUrl url) {
        setDarkMode(qobject_cast<QQuickWindow *>(object));
    });

    g_carboxylApp = this;
}

QString CarboxylApplication::styleName() {
    return m_styleName;
}

void CarboxylApplication::setStyleName(const QString &style) {
    m_styleName = style;
}

QQmlApplicationEngine* CarboxylApplication::engine() const {
    return m_engine;
}

CarboxylQuickInterface *CarboxylApplication::interface() const {
    return m_interface;
}

void CarboxylApplication::setDarkMode(bool dark) {
    setDarkMode(window(), dark);
}

void CarboxylApplication::setDarkMode(QQuickWindow *window)
{
    setDarkMode(window, m_darkMode);
}

void CarboxylApplication::setDarkMode(QQuickWindow *window, bool dark)
{
    m_darkMode = dark;
#ifdef _WIN32
    if (!window)
        return;

    auto hwnd = HWND(window->winId());
    if (!hwnd)
        return;

    BOOL val = dark ? TRUE : FALSE;

    // 21h2+ use attribute 20
    // <21h2 use attribute 19

    if (SUCCEEDED(DwmSetWindowAttribute(hwnd, 20, &val, sizeof(val))))
        goto resize;

    DwmSetWindowAttribute(hwnd, 19, &val, sizeof(val));

    // this is a tiny "fake" resize that we trigger because uhhhh windows sucks
    // and doesn't update the title bar until you resize
    // please lmk if there is a better solution
resize:
    RECT rc;
    GetWindowRect(hwnd, &rc);
    int width = rc.right - rc.left;
    int height = rc.bottom - rc.top;

    SetWindowPos(hwnd, nullptr,
                 0, 0, width + 1, height,
                 SWP_NOMOVE | SWP_NOZORDER | SWP_NOACTIVATE | SWP_ASYNCWINDOWPOS);
    SetWindowPos(hwnd, nullptr,
                 0, 0, width, height,
                 SWP_NOMOVE | SWP_NOZORDER | SWP_NOACTIVATE | SWP_ASYNCWINDOWPOS);
#endif
}

QQuickWindow *CarboxylApplication::window() const {
    auto objects = m_engine->rootObjects();
    if (objects.empty()) return nullptr;
    return qobject_cast<QQuickWindow *>(objects.first());
}
