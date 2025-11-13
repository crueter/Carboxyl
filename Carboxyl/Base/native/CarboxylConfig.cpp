// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

#include "CarboxylConfig.h"
#include "native/carboxyl_config.h"

CarboxylConfig::CarboxylConfig(QObject *parent)
    : QObject{parent}
{
    for (const std::string_view &str : Carboxyl::g_styles) {
        m_styles << QString::fromStdString(std::string{str});
    }
}
