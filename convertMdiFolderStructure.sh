#!/bin/bash

TARGET='markcons-mdi'

OUTLINED='materialsymbolsoutlined'
ROUNDED='materialsymbolsrounded'
SHARP='materialsymbolssharp'

PROPERTIES_REGEX='(_?wght([0-9]{0,3}))?(_?grad(N25|[0-9]{0,3}))?(_?fill1)?_(([0-9]+)px)'
SIZE_REGEX='([a-zA-Z0-9_]+)_([0-9]+)px'
ICON_WEIGHT=2
ICON_GRADE=4
ICON_FILL=5
ICON_SIZE=7

getRegexPath () {
    #$1 string
    #$2 regex
    if [[ $1 =~ $PROPERTIES_REGEX ]]
    then
        path=""
        weight=${BASH_REMATCH[$ICON_WEIGHT]}
        grade=${BASH_REMATCH[$ICON_GRADE]}
        fill=${BASH_REMATCH[$ICON_FILL]}
        size=${BASH_REMATCH[$ICON_SIZE]}
        if [[ $weight ]]; then path+="/${weight}"; fi
        if [[ $grade ]]; then path+="/${grade}"; fi
        if [[ $fill ]]; then path+="/fill"; fi
        path+="/${size}"
    else
        echo $1 "failed to extract info  - getRegex()"
    fi
}

componentsPath="./markcons/components/${TARGET}/components";
mkdir -p ${componentsPath}
for iconFolder in ./material-design-icons/* 
do 
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
            componentPath="${componentsPath}/${prefix}${fillPath}-${iconName}.svg"
            cp $file $componentPath
            echo $componentPath
        done
    done
done     
# for iconFolder in 
# do 
#     iconPath="${iconFolder}/*"
#     for iconStyle in ${iconPath}
#     do
#         svgPath="${iconStyle}/*"
#         style="${iconStyle##*/}" 
#         if [[ $style = $OUTLINED ]]; then prefix="outlined"; fi
#         if [[ $style = $ROUNDED ]]; then prefix="rounded"; fi
#         if [[ $style = $SHARP ]]; then prefix="sharp"; fi
#         for iconSvg in ${svgPath}
#         do
#             relativePath="./markcons/components/${TARGET}/${prefix}"
#             fileName="${iconSvg##*/}"
#             echo $fileName
#             weightString=${fileName%%"_wght"*}
#             gradeString=${fileName%%"_grad"*}
#             fillString=${fileName%%"_fill"*}
#             sizeString=${fileName%%"_"*"px"}
#             weightIndex=${#weightString}
#             gradeIndex=${#gradeString}
#             fillIndex=${#fillString}
#             sizeIndex=${#sizeString}
#             fileNameLength=${#fileName}
#             name="null"
#             size="0"
#             if [[ weightIndex -ne fileNameLength ]] || [[ gradeIndex -ne fileNameLength ]]
#             then
#                 #do nothing, skip
#                 continue
#             elif [[ fillIndex -ne fileNameLength ]]
#             then
#                 # substring=${fileName:${fillIndex}}
#                 name=${fileName:0:${fillIndex}}
#                 relativePath+="/fill"
#                 # getRegexPath $substring
#                 # relativePath+=$path"/${name}"
#             elif [[ sizeIndex -ne  fileNameLength ]]
#             then
#                 substring=${fileName:${sizeIndex}}
#                 size=${fileName:${sizeIndex}:2}
#             else 
#                 echo "File doesn't contain fill nor size"
#             fi
#             echo $name -- name
#             echo $relativePath
#             if [[ ${name} = 'null' ]]
#             then
#                 echo "Failed To Calculate Name"
#             else
#                 relativePath+="/${name}/${filename}"
#                 echo ${fileName}
#                 echo ${relativePath}
#                 # mkdir -p ${relativePath}
#                 # cp $iconSvg "$_"
#                 echo --------------------------------------------
#             fi
#         done    
#     done
# done