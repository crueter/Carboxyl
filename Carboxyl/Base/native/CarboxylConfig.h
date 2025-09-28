// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

#ifndef CARBOXYLCONFIG_H
#define CARBOXYLCONFIG_H

#include <QObject>
#include <QQmlEngine>

class CarboxylConfig : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList styles MEMBER m_styles CONSTANT)
public:
    explicit CarboxylConfig(QObject *parent = nullptr);

private:
    QStringList m_styles;
};

#endif // CARBOXYLCONFIG_H
