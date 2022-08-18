#!/bin/bash
#get all svg files in the components folder
files=$(find . -type f | grep .svg )        
num_of_files=$(echo ${files} | wc -w)
echo "Number of SVGs: " $num_of_files
idx=0
for file in $files
do
    idx=$((${idx}+1))
    directory=`dirname $file`
    newName="${directory}/index.marko"
    mv $file $newName
    sed -i '1s/>/ ...input>/' $newName
    progress=$(echo "scale=4;(${idx}*100/${num_of_files})" | bc)
    echo -ne "finished: ${progress}%\r"
done
