// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later

#include "CarboxylConfig.h"
#include "carboxyl_config.h"

CarboxylConfig::CarboxylConfig(QObject *parent)
    : QObject{parent}
{
    for (const std::string_view &str : Carboxyl::g_styles) {
        m_styles << QString::fromStdString(std::string{str});
    }
}
