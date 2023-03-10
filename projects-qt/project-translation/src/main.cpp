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
