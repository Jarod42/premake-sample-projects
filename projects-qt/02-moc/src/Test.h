#pragma once

#if 1 // Workaround for QT6.0.x bug
# include <QtGlobal> 
# if (QT_VERSION_CHECK(6, 0, 0) <= QT_VERSION) && (QT_VERSION <= QT_VERSION_CHECK(6, 1, 0))
#  include <limits> 
# endif
#endif

#include <QObject>

class Test : public QObject
{
	Q_OBJECT

signals:
	void test_signal();
public slots:
	void test_slot();
public:
	bool b = false;
};
