#include "qml_class2.h"

QmlClass2::QmlClass2(QObject *parent) : QObject(parent) {}

QString QmlClass2::getName() const { return m_name; }

void QmlClass2::setName(const QString &name) {
	if (name == m_name) {
		return;
	}
	m_name = name;
	emit nameChanged();
}
