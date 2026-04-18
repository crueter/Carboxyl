// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later

#ifndef CARBOXYLAPPLICATION_H
#define CARBOXYLAPPLICATION_H

#include <QGuiApplication>
#include <QObject>
#include <QQmlApplicationEngine>
#include <QQuickWindow>

class CarboxylQuickInterface;
class CarboxylConfig;

class CarboxylApplication : public QObject {
    Q_OBJECT
    Q_PROPERTY(QString styleName READ styleName WRITE setStyleName NOTIFY styleChanged)
    Q_PROPERTY(bool systemDarkMode MEMBER m_systemDarkMode CONSTANT)
public:
    /**
     * @brief CarboxylApplication A class that sets up Carboxyl for use in QML land.
     * @param app Pass your application instancehere.
     * @param engine Pass your QML engine here.
     * @param style The user's selected style. Usually this should be fetched from settings/config.
     * @param defaultStyle Your application's preferred default style.
     * @param alwaysActive If true, disables the use of the inactive color palette. Useful for
     * applications that expect to be out of focus most of the time.
     */
    CarboxylApplication(QGuiApplication& app, QQmlApplicationEngine* engine,
                        const QString& style = QString(),
                        const QString& defaultStyle = QStringLiteral("Trioxide"),
                        const bool alwaysActive = false);

    QString styleName();
    void setStyleName(const QString& style);

    QQmlApplicationEngine* engine() const;
    CarboxylQuickInterface* interface() const;

public slots:
    void setDarkMode(QQuickWindow* window);
    void setDarkMode(QQuickWindow* window, bool dark);
    void setDarkMode(bool dark);

private:
    QQuickWindow* window() const;

    QQmlApplicationEngine* m_engine;
    CarboxylConfig* m_config;
    CarboxylQuickInterface* m_interface;

    QString m_styleName;
    const QString& m_defaultStyle;
    bool m_systemDarkMode;
    bool m_darkMode;

Q_SIGNALS:
    void styleChanged();
};

extern CarboxylApplication* g_carboxylApp;

#endif // CARBOXYLAPPLICATION_H
