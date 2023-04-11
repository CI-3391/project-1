#!/bin/sh

PROYECT_NAME='project-1'
A1='15-11377'
A2='15-10789'
FILE_NAME="${PROYECT_NAME}_${A1}_${A2}.tar.gz"
FILES_TO_INCLUDE='./db ./resources/model.png ./run.sh ./readme.txt'

if test -f "$FILE_NAME"; then 
    rm $FILE_NAME  
fi

tar -cvf $FILE_NAME $FILES_TO_INCLUDE