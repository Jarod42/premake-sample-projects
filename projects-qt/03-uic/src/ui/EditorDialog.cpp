#include "EditorDialog.h"

//------------------------------------------------------------------------------
EditorDialog::EditorDialog(QWidget* parent) : QDialog(parent), ui(new Ui::EditorDialog)
{
    ui->setupUi(this);
}

//------------------------------------------------------------------------------
EditorDialog::~EditorDialog()= default;
