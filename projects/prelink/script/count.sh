#/bin/sh

config=$1

echo "ls -1 obj/$config/*.o* | wc -l > bin/"$config"/count.txt"
ls -1 obj/$config/*.o*
ls -1 obj/$config/*.o* | wc -l > bin/$config/count.txt
