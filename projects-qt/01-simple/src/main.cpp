#if 1 // Workaround for QT6.0.x bug
# include <QtGlobal> 
# if (QT_VERSION_CHECK(6, 0, 0) <= QT_VERSION) && (QT_VERSION <= QT_VERSION_CHECK(6, 1, 0))
#  include <limits> 
# endif
#endif

#include <QCoreApplication>

int main(int argc, char* argv[])
{
    QCoreApplication app(argc, argv);
    return 0;
}
