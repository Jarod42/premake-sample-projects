@set config=%1

@dir /B obj\%config%\*.o* | wc -l  > bin\%config%\count.txt
