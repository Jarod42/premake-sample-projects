#include "qml_class.h"

QmlClass::QmlClass(QObject *parent) : QObject(parent) {}

QString QmlClass::getName() const { return m_name; }

void QmlClass::setName(const QString &name) {
	if (name == m_name) {
		return;
	}
	m_name = name;
	emit nameChanged();
}
