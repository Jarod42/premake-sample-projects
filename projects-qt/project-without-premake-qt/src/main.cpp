#if 1 // Workaround for QT6.0.x bug
# include <QtGlobal> 
# if (QT_VERSION_CHECK(6, 0, 0) <= QT_VERSION) && (QT_VERSION <= QT_VERSION_CHECK(6, 1, 0))
#  include <limits> 
# endif
#endif

#include <QApplication>
#include <QFile>
#include <QTranslator>

#include "ui/EditorDialog.h"

QByteArray readAll(QString filename)
{
    QFile file(filename);
    file.open(QIODevice::ReadOnly);
    return file.readAll();
}

int main(int argc, char* argv[])
{
    const auto byteArray = readAll(":file.txt"); // test qrc
    if (byteArray != "hello world")
    {
        return -1;
    }
    QApplication app(argc, argv);

    QTranslator frTranslator;
    // executable is in bin/Release
    // whereas qm file are in bin
    if (!frTranslator.load("../app_fr.qm", QCoreApplication::applicationDirPath()))
    {
        return -2;
    }
    app.installTranslator(&frTranslator);

    EditorDialog dialog;

    dialog.ui->label->setText("");
    QObject::connect(&dialog, SIGNAL(test_signal()), &dialog, SLOT(hello_world()));
    emit dialog.test_signal();
    if (dialog.ui->label->text() != "hello world")
    {
        return -3;
    }
    if (argc == 1)  // Do nothing in test mode
    {
        return 0;
    }
    dialog.show();
    return app.exec();
}
