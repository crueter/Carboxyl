#ifndef CARBOXYLAPPLICATION_H
#define CARBOXYLAPPLICATION_H

#include <QObject>
#include <QQmlApplicationEngine>

class CarboxylApplication : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString styleName READ styleName WRITE setStyleName NOTIFY styleChanged)
public:
    explicit CarboxylApplication(QQmlApplicationEngine *engine, QObject *parent = nullptr);

    Q_INVOKABLE void setDarkMode(bool dark);
    Q_INVOKABLE bool systemIsDarkMode();
    Q_INVOKABLE bool localDarkMode();

    QString styleName();
    void setStyleName(const QString &name);

private:
    QQmlApplicationEngine *m_engine;
    bool m_darkMode;

    QString m_styleName;

signals:
    void styleChanged();
};

#endif // CARBOXYLAPPLICATION_H
