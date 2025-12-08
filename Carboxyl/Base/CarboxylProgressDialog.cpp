// SPDX-FileCopyrightText: Copyright 2025 crueter
// SPDX-License-Identifier: GPL-3.0-or-later

#include <QQmlComponent>
#include "CarboxylApplication.h"
#include "CarboxylProgressDialog.h"

CarboxylProgressDialog::CarboxylProgressDialog(QObject* parent) : QObject(parent) {
    init();
}

CarboxylProgressDialog::CarboxylProgressDialog(const QString& labelText,
                                               const QString& cancelButtonText, int minimum,
                                               int maximum, QObject* parent)
    : QObject(parent) {
    init();
    setLabelText(labelText);
    // TODO: CancelButtonText
    setMinimum(minimum);
    setMaximum(maximum);
}

void CarboxylProgressDialog::init() {
    const auto engine = g_carboxylApp->engine();

    QQmlComponent dialogComponent(
        engine, QUrl(QStringLiteral("qrc:/qt/qml/Carboxyl/Contour/ProgressDialog.qml")), this);

    if (dialogComponent.isError()) {
        qWarning() << "Error instantiating ProgressDialog:" << dialogComponent.errors();
    }

    m_dialog = dialogComponent.create();
    if (!m_dialog) {
        qWarning() << "Failed to create ProgressDialog";
    }

#define FORWARD_SIGNAL(sig) connect(m_dialog, SIGNAL(sig), this, SIGNAL(sig))
    FORWARD_SIGNAL(labelTextChanged());
    FORWARD_SIGNAL(minimumChanged());
    FORWARD_SIGNAL(maximumChanged());
    FORWARD_SIGNAL(valueChanged());
    FORWARD_SIGNAL(autoCloseChanged());
    FORWARD_SIGNAL(autoResetChanged());
    FORWARD_SIGNAL(wasCanceledChanged());
    FORWARD_SIGNAL(minimumDurationChanged());
#undef FORWARD_SIGNAL
}

QString CarboxylProgressDialog::labelText() const {
    return m_dialog->property("labelText").toString();
}

void CarboxylProgressDialog::setLabelText(const QString& text) {
    m_dialog->setProperty("labelText", text);
    emit labelTextChanged();
}

void CarboxylProgressDialog::show() {
    QMetaObject::invokeMethod(m_dialog, "show");
}

int CarboxylProgressDialog::minimum() const {
    return m_dialog->property("minimum").toInt();
}

void CarboxylProgressDialog::setMinimum(int newMinimum) {
    m_dialog->setProperty("minimum", newMinimum);
    emit minimumChanged();
}

int CarboxylProgressDialog::maximum() const {
    return m_dialog->property("maximum").toInt();
}

void CarboxylProgressDialog::setMaximum(int newMaximum) {
    m_dialog->setProperty("maximum", newMaximum);
    emit maximumChanged();
}

int CarboxylProgressDialog::value() const {
    return m_dialog->property("value").toInt();
}

void CarboxylProgressDialog::setValue(int newValue) {
    m_dialog->setProperty("value", newValue);
    emit valueChanged();
}

bool CarboxylProgressDialog::autoClose() const {
    return m_dialog->property("autoClose").toBool();
}

void CarboxylProgressDialog::setAutoClose(bool enable) {
    m_dialog->setProperty("autoClose", enable);
    emit autoCloseChanged();
}

bool CarboxylProgressDialog::autoReset() const {
    return m_dialog->property("autoReset").toBool();
}

void CarboxylProgressDialog::setAutoReset(bool enable) {
    m_dialog->setProperty("autoReset", enable);
    emit autoResetChanged();
}
bool CarboxylProgressDialog::wasCanceled() const {
    return m_dialog->property("wasCanceled").toBool();
}

void CarboxylProgressDialog::setWasCanceled(bool cancelled) {
    m_dialog->setProperty("wasCanceled", cancelled);
    emit wasCanceledChanged();
}

int CarboxylProgressDialog::minimumDuration() const {
    return m_dialog->property("minimumDuration").toInt();
}

void CarboxylProgressDialog::setMinimumDuration(int ms) {
    m_dialog->setProperty("minimumDuration", ms);
    emit minimumDurationChanged();
}

QString CarboxylProgressDialog::title() const {
    return m_dialog->property("title").toString();
}

void CarboxylProgressDialog::setTitle(const QString& title) {
    m_dialog->setProperty("title", title);
    emit titleChanged();
}

int CarboxylProgressDialog::width() const {
    return m_dialog->property("width").toInt();
}

void CarboxylProgressDialog::setWidth(int newWidth) {
    m_dialog->setProperty("width", newWidth);
    emit widthChanged();
}

// ─────────────────────────────────────────────────────────────────────────────
// height
int CarboxylProgressDialog::height() const {
    return m_dialog->property("height").toInt();
}

void CarboxylProgressDialog::setHeight(int newHeight) {
    m_dialog->setProperty("height", newHeight);
    emit heightChanged();
}
