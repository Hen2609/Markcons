#!/bin/bash
#get all svg files in the components folder
files=$(find ./components/ -type f | grep .svg )        
num_of_files=$(echo ${files} | wc -w)
echo "Number of SVGs: " $num_of_files
idx=0
for file in $files
do
    idx=$((${idx}+1))
    fileName="${file%.svg}.marko"
    mv $file $fileName
    cat $fileName | python3 strip_svg.py > tmp
    viewBox=`grep -Eo 'viewBox=".*?"' ${fileName}`
    echo "\$ const { title, desc, ...otherAttrs } = input" > $fileName
    echo "<baseSVG ${viewBox} ...otherAttrs>" >> $fileName
    echo "<title>\${title}</title><desc>\${desc}</desc>" >> $fileName
    cat tmp >> $fileName
    echo "</baseSVG>" >> $fileName
    progress=$(echo "scale=4;(${idx}*100/${num_of_files})" | bc)
    echo -ne "finished: ${progress}%\r"
done
rm tmp

