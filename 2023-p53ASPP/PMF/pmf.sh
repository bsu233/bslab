#!/bin/bash
  
cwd=`pwd`


for i in `seq 0 50`

do

       cd $cwd && mkdir $i && cd $i

        center=`echo | awk '{ print 31.5 + '$i'*0.5 }'`
        lm=`echo | awk '{ print '$center'-2 }'`
        up=`echo | awk '{ print '$center'+2 }'`

        cp $cwd/input/limit.dat .
        cp $cwd/input/prod.in .
        cp $cwd/input/HM.parm .

        sed -i 's/DD/'$center'/g' limit.dat
        sed -i 's/D1/'$lm'/g' limit.dat
        sed -i 's/D2/'$up'/g' limit.dat

 if [ $i -eq 0 ]; then
         cp $cwd/input/prod.rst x.rst
 else
        preves=$((i-1))
         cp $cwd/$preves/win.rst x.rst
 fi


  pmemd.cuda -O -i prod.in -c x.rst -p HM.parm -r win.rst -o win.out -x win.nc -ref x.rst
done
