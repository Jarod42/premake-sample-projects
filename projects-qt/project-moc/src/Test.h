#pragma once

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
