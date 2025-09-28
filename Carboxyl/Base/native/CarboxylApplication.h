// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

#ifndef CARBOXYLAPPLICATION_H
#define CARBOXYLAPPLICATION_H

#include <QColor>
#include <QGuiApplication>
#include <QObject>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>

#include "CarboxylConfig.h"

#if QT_VERSION >= QT_VERSION_CHECK(6, 5, 0)
#include <QStyleHints>
#else
#include <QPalette>
#endif

class CarboxylApplication : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString styleName READ styleName WRITE setStyleName NOTIFY styleChanged)
    Q_PROPERTY(bool systemDarkMode MEMBER m_systemDarkMode CONSTANT)
public:
    CarboxylApplication(QGuiApplication &app,
                        QQmlApplicationEngine *engine,
                        const QString &style = "",
                        const QString &defaultStyle = "Trioxide");

    QString styleName();
    void setStyleName(const QString &style);

private:
    QQmlApplicationEngine *m_engine;
    CarboxylConfig *m_config;

    QString m_styleName;
    const QString &m_defaultStyle;
    bool m_systemDarkMode;

signals:
    void styleChanged();
};

#endif // CARBOXYLAPPLICATION_H
