#include "settingsmanager.h"

SettingsManager::SettingsManager(QObject *parent)
    : QObject{parent}
{}

void SettingsManager::set(const QString &key, const QVariant &value)
{
    m_settings.setValue(key, value);
}

QVariant SettingsManager::get(const QString &key, const QVariant &defaultValue)
{
    return m_settings.value(key, defaultValue);
}
