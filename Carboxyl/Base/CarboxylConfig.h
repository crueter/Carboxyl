// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later

#pragma once

#include <QObject>

class CarboxylConfig : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringList styles MEMBER m_styles CONSTANT)
    Q_PROPERTY(QString gitLink MEMBER m_gitLink CONSTANT)
public:
    explicit CarboxylConfig(QObject *parent = nullptr);

private:
    QStringList m_styles;

    // TODO(crueter): Configurable
    QString m_gitLink = QStringLiteral("https://git.crueter.xyz/crueter/Carboxyl");
};
