#!/bin/sh

if test -f "project-1_15-11377.tar.gz"; then 
    rm project-1_15-11377.tar.gz  
fi

tar -cvf project-1_15-11377.tar.gz ./db ./resources/model.png ./run.sh ./readme.txt