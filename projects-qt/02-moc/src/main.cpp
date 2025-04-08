#if 1 // Workaround for QT6.0.x bug
# include <QtGlobal> 
# if (QT_VERSION_CHECK(6, 0, 0) <= QT_VERSION) && (QT_VERSION <= QT_VERSION_CHECK(6, 1, 0))
#  include <limits> 
# endif
#endif

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
