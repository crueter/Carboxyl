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

class CarboxylApplication : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString styleName READ styleName WRITE setStyleName NOTIFY styleChanged)
    Q_PROPERTY(bool systemDarkMode MEMBER m_systemDarkMode CONSTANT)
public:
    CarboxylApplication(QGuiApplication &app,
                        QQmlApplicationEngine *engine,
                        const QString &style = QString(),
                        const QString &defaultStyle = QStringLiteral("Trioxide"));

    QString styleName();
    void setStyleName(const QString &style);

    QQmlApplicationEngine* engine() const;
    CarboxylQuickInterface* interface() const;

public slots:
    void setDarkMode(QQuickWindow *window);
    void setDarkMode(QQuickWindow *window, bool dark);
    void setDarkMode(bool dark);

private:
    QQuickWindow *window() const;

    QQmlApplicationEngine *m_engine;
    CarboxylConfig *m_config;
    CarboxylQuickInterface *m_interface;

    QString m_styleName;
    const QString &m_defaultStyle;
    bool m_systemDarkMode;
    bool m_darkMode;

Q_SIGNALS:
    void styleChanged();
};

extern CarboxylApplication *g_carboxylApp;

#endif // CARBOXYLAPPLICATION_H

