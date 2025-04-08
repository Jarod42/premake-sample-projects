#if 1 // Workaround for QT6.0.x bug
# include <QtGlobal> 
# if (QT_VERSION_CHECK(6, 0, 0) <= QT_VERSION) && (QT_VERSION <= QT_VERSION_CHECK(6, 1, 0))
#  include <limits> 
# endif
#endif

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
