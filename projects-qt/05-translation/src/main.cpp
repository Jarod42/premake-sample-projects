#if 1 // Workaround for QT6.0.x bug
# include <QtGlobal> 
# if (QT_VERSION_CHECK(6, 0, 0) <= QT_VERSION) && (QT_VERSION <= QT_VERSION_CHECK(6, 1, 0))
#  include <limits> 
# endif
#endif

#include <QCoreApplication>
#include <QTranslator>

int main(int argc, char* argv[])
{
    QCoreApplication app(argc, argv);

    QTranslator frTranslator;
    if (!frTranslator.load("app_fr.qm", QCoreApplication::applicationDirPath()))
    {
        return -2;
    }
    app.installTranslator(&frTranslator);

    QString s = QCoreApplication::translate("main", "Hello world");

    return 0;
}
