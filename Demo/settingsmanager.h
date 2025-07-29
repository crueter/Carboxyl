#ifndef SETTINGSMANAGER_H
#define SETTINGSMANAGER_H

#include <QSettings>
#include <QObject>

class SettingsManager : public QObject
{
    Q_OBJECT
public:
    explicit SettingsManager(QObject *parent = nullptr);

    Q_INVOKABLE void set(const QString &key, const QVariant &value);
    Q_INVOKABLE QVariant get(const QString &key, const QVariant &defaultValue);

private:
    QSettings m_settings;
};

#endif // SETTINGSMANAGER_H
