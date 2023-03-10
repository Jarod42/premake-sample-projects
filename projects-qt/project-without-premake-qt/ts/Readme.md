Sample translation files of project.

Files are created by (assuming Qt in $PATH):

`lupdate -locations none -no-ui-lines -target-language $(LANG) .. -ts $(APP)_$(LANG).ts`

Updated by:

`lupdate -locations none -no-ui-lines .. -ts *.ts`
