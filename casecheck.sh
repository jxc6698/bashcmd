#!/bin/bash
# check whether filename is written correctly in a case-ignore file-system. Ensure the code will run correctly in a case-sensitive file-system.
#
#

#filelist=`find  -E .  -regex ".*\.((html)|(js))"  -not -path "./content/global_page/assets/*" | xargs basename`

#echo $filelist


echo "show case mistake filename"

#for name in ${fileline}
for fname in `find  -E  .  -regex ".*\.((html)|(js))"  -not -path "./content/global_page/assets/*" -not -path "./.git/*" | xargs basename`
do
    numsensitive=`grep -orn --exclude-dir=\.git --exclude-dir=\.idea "$fname" . | wc -l`
    num=`grep -iorn --exclude-dir=\.git --exclude-dir=\.idea "$fname" . | wc -l`
    if [ $numsensitive -ne $num ]
    then
        echo $fname
        echo "case sensitive: " $numsensitive
        echo "case ignore: " $num
    fi
done
