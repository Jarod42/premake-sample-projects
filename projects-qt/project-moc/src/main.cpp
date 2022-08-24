#include <QCoreApplication>

#include "Test.h"

int main(int argc, char* argv[])
{
	QCoreApplication app(argc, argv);

	Test test;
	QObject::connect(&test, SIGNAL(test_signal()), &test, SLOT(test_slot()));
	emit test.test_signal();
	if (test.b != true)
	{
		return -1;
	}
	return 0;
}
