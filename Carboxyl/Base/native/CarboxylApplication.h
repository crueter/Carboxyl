#ifndef CARBOXYLAPPLICATION_H
#define CARBOXYLAPPLICATION_H

#include <QObject>
#include <QQmlEngine>

class CarboxylApplication : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    QML_SINGLETON
public:
    explicit CarboxylApplication(QObject *parent = nullptr);

    Q_INVOKABLE void setDarkMode(bool dark);
    Q_INVOKABLE bool systemIsDarkMode();

signals:
};

#endif // CARBOXYLAPPLICATION_H
