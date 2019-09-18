#!/bin/bash

unzip $1 -d ${1%%.*}

cd ${1%%.*}
ls | while read line
do 
partway=${line##*joust_}

userid=${partway%%_attempt*}

echo "-->$userid<--"

userid2=${userid##*_}

mkdir "$userid2"
mv "$line" "$userid2"

done


for userid in $(ls); do

ls
cd $userid
ls
##inside

if tar -tf *.tar.gz || unzip *.zip > $userid; then
tar -xvzf *.tar.gz
else
echo "Student-->" $userid" <--: Does not contain tar ball/zip" > no_tar_or_zip.txt
fi

cd ..

done

for userid in $(ls); do

cd $userid

if ! grep -q There\ is *.txt; then 
 sed -n '7,8p' *.txt > readme.txt 
fi

if ! grep -q There\ are *.txt; then 
 sed -n '10p' *.txt > readme.txt 
fi
 
cd ..
done
