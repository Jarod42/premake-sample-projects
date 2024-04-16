#include <iostream>
#include <memory>

#include <QCoreApplication>
#include <QQmlApplicationEngine>

#include "qml_class.h"
#include "qml_class2.h"


int main(int argc, char* argv[])
{
	QCoreApplication app(argc, argv);

#if 0 //
	qmlRegisterType<QmlClass>("qml_class", 1, 0, "QmlClass");
	qmlRegisterType<QmlClass2>("qml_class", 1, 0, "QmlClass2");
#endif

	QQmlEngine engine;

	QQmlComponent component(&engine, QUrl(QStringLiteral("qrc:/qml_class.qml")));

	if (const std::unique_ptr<QObject> object{component.create()}) {
		const auto name = object->property("name").toString();

		if (name != "John Doe") {
			std::cerr << "Not expected name: " << name.toStdString() << std::endl;
			return -2;
		}
	} else {
		std::cerr << "Cannot create QmlClass" << std::endl;
		return -1;
	}
	QQmlComponent component2(&engine, QUrl(QStringLiteral("qrc:/qml_class2.qml")));
	if(const std::unique_ptr<QObject> object{component2.create()})
	{
		const auto name = object->property("name").toString();

		if(name != "Jane Doe") {
			std::cerr << "Not expected name: " << name.toStdString() << std::endl;
			return -4;
		}
	} else {
		std::cerr << "Cannot create QmlClass2" << std::endl;
		return -3;
	}
}
