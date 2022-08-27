#!/bin/bash

TARGET='markcons-fa'

componentsPath="./markcons/components/${TARGET}";
mkdir -p ${componentsPath}
echo -e "{\"taglib-id\": \"${TARGET}\",\n\"tags-dir\": \"./\"\n}" > "${componentsPath}/marko.json"
idx=0
for iconFolder in ./Font-Awesome-Icons/* 
do 
    style="${iconFolder##*/}"
    files=$( find "${iconFolder}" -type f -name '*.svg')
    for icon in $files
    do  
        idx=$((${idx}+1)) 
        iconName="${icon##*/}"
        iconName="${iconName%.svg}"
        folderPath="${componentsPath}/${TARGET}-${style}-${iconName}"
        mkdir -p $folderPath
        svgPath="${folderPath}/index.svg"
        cp $icon $svgPath
        echo -ne "Finished: ${idx}\r"
    done
done        