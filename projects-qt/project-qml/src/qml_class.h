#ifndef QML_CLASS_H
#define QML_CLASS_H

#include <QObject>
#include <QString>
#include <QtQml>

class QmlClass : public QObject
{
	Q_OBJECT
	Q_PROPERTY(QString name READ getName WRITE setName NOTIFY nameChanged)
#if 0
	QML_ELEMENT
#else
	Q_CLASSINFO("QML.Element", "auto")
#endif

public:
	explicit QmlClass(QObject *parent = nullptr);

	QString getName() const;
	void setName(const QString &userName);

signals:
	void nameChanged();

private:
	QString m_name;
};

#endif
