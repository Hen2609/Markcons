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


for iconFolder in ./material-design-icons/*
do 
    iconPath="${iconFolder}/*"
    for iconStyle in ${iconPath}
    do
        svgPath="${iconStyle}/*"
        style="${iconStyle##*/}" 
        if [[ $style = $OUTLINED ]]; then prefix="outlined"; fi
        if [[ $style = $ROUNDED ]]; then prefix="rounded"; fi
        if [[ $style = $SHARP ]]; then prefix="sharp"; fi
        for iconSvg in ${svgPath}
        do
            fileName="${iconSvg##*/}"
            weightString=${fileName%%"_wght"*}
            gradeString=${fileName%%"_grad"*}
            fillString=${fileName%%"_fill"*}
            sizeString=${fileName%%"_"*"px"}
            weightIndex=${#weightString}
            gradeIndex=${#gradeString}
            fillIndex=${#fillString}
            sizeIndex=${#sizeString}
            fileNameLength=${#fileName}
            name="null"
            if [[ weightIndex -ne fileNameLength ]]
            then
                # substring=${fileName:${weightIndex}}
                name=${fileName:0:${weightIndex}}
                # getRegexPath $substring
                # relativePath+=$path"/${name}"
            elif [[ gradeIndex -ne fileNameLength ]]
            then 
                # substring=${fileName:${gradeIndex}}
                name=${fileName:0:${gradeIndex}}
                # getRegexPath $substring
                # relativePath+=$path"/${name}"
            elif [[ fillIndex -ne fileNameLength ]]
            then
                # substring=${fileName:${fillIndex}}
                name=${fileName:0:${fillIndex}}
                # getRegexPath $substring
                # relativePath+=$path"/${name}"
            else
                if [[ $fileName =~ $SIZE_REGEX ]]
                then
                    name=${BASH_REMATCH[1]} #first match equals name, second match equals size
                else
                    echo "Failed to extract data"
                fi
            fi
            if [[ ${name} = 'null' ]]
            then
                echo "Failed To Calculate Name"
            else
                relativePath="./markcons/componenets/${TARGET}/${name}/${prefix}/${ffileName}"
                echo ${fileName}
                echo ${relativePath}
                mkdir -p ${relativePath}
                cp $iconSvg "$_"
                echo --------------------------------------------
            fi
        done    
    done
done