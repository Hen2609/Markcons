#!/bin/bash
#get all svg files in the components folder
files=$(find . -type f | grep .svg )        
num_of_files=$(echo ${files} | wc -w)
echo "Number of SVGs: " $num_of_files
idx=0
for file in $files
do
    idx=$((${idx}+1))
    fileName="${file%.svg}.marko"
    mv $file $fileName
    sed -i 's/</$ const {title, description, ...otherAttrs} = input; \n</' $fileName
    sed -i 's/>/ ...otherAttrs>\n<title>${title}<\/title>\n<description>${description}<\/description>\n/' $fileName
    progress=$(echo "scale=4;(${idx}*100/${num_of_files})" | bc)
    echo -ne "finished: ${progress}%\r"
done

