#ifndef CARBOXYLAPPLICATION_H
#define CARBOXYLAPPLICATION_H

#include <QObject>
#include <QQmlApplicationEngine>

class CarboxylApplication : public QObject
{
    Q_OBJECT
public:
    explicit CarboxylApplication(QQmlApplicationEngine *engine, QObject *parent = nullptr);

    Q_INVOKABLE void setDarkMode(bool dark);
    Q_INVOKABLE bool systemIsDarkMode();

private:
    QQmlApplicationEngine *m_engine;

signals:
    void styleChanged();
};

#endif // CARBOXYLAPPLICATION_H
