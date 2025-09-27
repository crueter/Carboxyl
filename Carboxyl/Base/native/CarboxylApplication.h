// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

#ifndef CARBOXYLAPPLICATION_H
#define CARBOXYLAPPLICATION_H

#include <QColor>
#include <QObject>
#include <QQmlApplicationEngine>

class CarboxylApplication : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString styleName READ styleName WRITE setStyleName NOTIFY styleChanged)
    Q_PROPERTY(bool systemDarkMode MEMBER m_systemDarkMode CONSTANT)
public:
    explicit CarboxylApplication(QQmlApplicationEngine *engine, QObject *parent = nullptr);

    QString styleName();
    void setStyleName(const QString &name);

private:
    QQmlApplicationEngine *m_engine;

    QString m_styleName;
    bool m_systemDarkMode;

signals:
    void styleChanged();
};

#endif // CARBOXYLAPPLICATION_H
