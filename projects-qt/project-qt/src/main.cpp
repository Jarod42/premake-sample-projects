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
    // executable and qm files are in bin/Release
    if (!frTranslator.load("app_fr.qm", QCoreApplication::applicationDirPath()))
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
