#!/bin/bash

cwd=`pwd`
for i in `seq 0 19`
do
        cd $cwd/Lambda_$i/Production_MD
        cp ./md$i.xvg $cwd/md-xvg/$i.xvg
done
