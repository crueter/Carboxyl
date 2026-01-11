// SPDX-FileCopyrightText: Copyright 2026 crueter
// SPDX-License-Identifier: LGPL-3.0-or-later

#pragma once

#include <QObject>

class CarboxylProgressDialog : public QObject {
    Q_OBJECT

    // clang-format off
    Q_PROPERTY(QString labelText      READ labelText       WRITE setLabelText       NOTIFY labelTextChanged)
    Q_PROPERTY(QString title          READ title           WRITE setTitle           NOTIFY titleChanged)
    Q_PROPERTY(int    minimum         READ minimum         WRITE setMinimum         NOTIFY minimumChanged)
    Q_PROPERTY(int    maximum         READ maximum         WRITE setMaximum         NOTIFY maximumChanged)
    Q_PROPERTY(int    value           READ value           WRITE setValue           NOTIFY valueChanged)
    Q_PROPERTY(bool   autoClose       READ autoClose       WRITE setAutoClose       NOTIFY autoCloseChanged)
    Q_PROPERTY(bool   autoReset       READ autoReset       WRITE setAutoReset       NOTIFY autoResetChanged)
    Q_PROPERTY(bool   wasCanceled     READ wasCanceled     WRITE setWasCanceled     NOTIFY wasCanceledChanged)
    Q_PROPERTY(int    minimumDuration READ minimumDuration WRITE setMinimumDuration NOTIFY minimumDurationChanged)

    Q_PROPERTY(int width  READ width  WRITE setWidth  NOTIFY widthChanged)
    Q_PROPERTY(int height READ height WRITE setHeight NOTIFY heightChanged)
    // clang-format on
public:
    CarboxylProgressDialog(QObject* parent = nullptr);
    CarboxylProgressDialog(const QString& labelText, const QString& cancelButtonText, int minimum,
                           int maximum, QObject* parent = nullptr);

    int minimum() const;
    void setMinimum(int newMinimum);

    int maximum() const;
    void setMaximum(int newMaximum);

    int value() const;
    void setValue(int newValue);

    bool autoClose() const;
    void setAutoClose(bool newAutoClose);

    bool autoReset() const;
    void setAutoReset(bool newAutoReset);

    bool wasCanceled() const;
    void setWasCanceled(bool newWasCanceled);

    int minimumDuration() const;
    void setMinimumDuration(int newMinimumDuration);

    QString labelText() const;
    void setLabelText(const QString& newLabelText);

    QString title() const;
    void setTitle(const QString& newTitle);

    int width() const;
    void setWidth(int newWidth);

    int height() const;
    void setHeight(int newHeight);

public Q_SLOTS:
    void show();
    void close();

Q_SIGNALS:
    void minimumChanged();
    void maximumChanged();
    void valueChanged();
    void autoCloseChanged();
    void autoResetChanged();
    void wasCanceledChanged();
    void minimumDurationChanged();
    void labelTextChanged();

    void titleChanged();
    void widthChanged();
    void heightChanged();

    void closed();

private:
    QObject* m_dialog;
    void init();
};

