#include <QApplication>

#include "ui/EditorDialog.h"

int main(int argc, char* argv[])
{
    QApplication app(argc, argv);
    EditorDialog dialog;

    if (argc == 1)  // Do nothing in test mode
    {
        return 0;
    }
    dialog.show();
    return app.exec();
}
