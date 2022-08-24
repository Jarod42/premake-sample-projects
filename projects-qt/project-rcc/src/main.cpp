#include <QCoreApplication>
#include <QFile>

static QByteArray readAll(QString filename)
{
    QFile file(filename);
    file.open(QIODevice::ReadOnly);
    return file.readAll();
}

int main(int argc, char* argv[])
{
    QCoreApplication app(argc, argv);
    const auto byteArray = readAll(":file.txt"); // test qrc
    if (byteArray != "hello world")
    {
        return -1;
    }
    return 0;
}
