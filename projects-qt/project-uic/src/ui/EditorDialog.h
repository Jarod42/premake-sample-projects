#pragma once

#if 1 // Workaround for QT6.0.x bug
# include <QtGlobal> 
# if (QT_VERSION_CHECK(6, 0, 0) <= QT_VERSION) && (QT_VERSION <= QT_VERSION_CHECK(6, 1, 0))
#  include <limits> 
# endif
#endif

#include <QDialog>
#include <memory>

#include "ui_EditorDialog.h"
class EditorDialog : public QDialog
{
public:
    explicit EditorDialog(QWidget* parent = nullptr);
    ~EditorDialog() override;

public:
    std::unique_ptr<Ui::EditorDialog> ui;
};
