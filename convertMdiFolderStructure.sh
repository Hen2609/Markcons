#!/bin/bash

TARGET='markcons-mdi'

OUTLINED='materialsymbolsoutlined'
ROUNDED='materialsymbolsrounded'
SHARP='materialsymbolssharp'

componentsPath="./markcons/components/${TARGET}";
mkdir -p ${componentsPath}
echo -e "{\"taglib-id\": \"markcons-mdi\",\n\"tags-dir\": \"./\"\n}" > "${componentsPath}/marko.json"
idx=0
for iconFolder in ./material-design-icons/* 
do 
    idx=$((${idx}+1))
    iconPath="${iconFolder}/*"
    iconName="${iconFolder##*/}"
    for iconStyle in ${iconPath}
    do
        svgPath="${iconStyle}/*"
        style="${iconStyle##*/}" 
        if [[ $style = $OUTLINED ]]; then prefix="outlined"; fi
        if [[ $style = $ROUNDED ]]; then prefix="rounded"; fi
        if [[ $style = $SHARP ]]; then prefix="sharp"; fi
        files=$( find ${svgPath} -type f -name '*24px.svg' | grep -v wght | grep -v grad )
        for file in $files
        do
            if [[ $file =~ .*"fill1_24px.svg" ]]; then fillPath="-fill"; else fillPath=""; fi
            folderPath="${componentsPath}/${TARGET}-${prefix}${fillPath}-${iconName}"
            mkdir -p $folderPath
            svgPath="${folderPath}/index.svg"
            cp $file $svgPath
            echo -ne "finished: ${idx}\r"
        done
    done
done        