!/bin/bash

cwd=`pwd`

phi_min_values=(-60 -60 -60 -60 -60)   
phi_center_values=(-52.5 -52.5 -52.5 -52.5 -52.5)  
phi_max_values=(-45 -45 -45 -45 -45)   


for i in `seq 1 60` 
do
    cd $cwd && mkdir $i && cd $i

    center=`echo | awk '{ print 6.0 + '$i'*0.5 }'`  
    lm=`echo | awk '{ print '$center'-2 }'`          
    up=`echo | awk '{ print '$center'+2 }'`          
    
   
   
    phi_min=${phi_min_values[$i]}
    phi_center=${phi_center_values[$i]}
    phi_max=${phi_max_values[$i]}
    
    cp $cwd/input/limit.dat .
    cp $cwd/input/prod.in .
    cp $cwd/input/HM.parm .

   
    sed -i 's/DD/'$center'/g' limit.dat
    sed -i 's/D1/'$lm'/g' limit.dat
    sed -i 's/D2/'$up'/g' limit.dat
    

    sed -i 's/PHI_MIN/'$phi_min'/g' limit.dat
    sed -i 's/PHI_CENTER/'$phi_center'/g' limit.dat
    sed -i 's/PHI_MAX/'$phi_max'/g' limit.dat
   

    if [ $i -eq 0 ]; then
        cp $cwd/input/prod.rst x.rst
    else
        preves=$((i-1))
        cp $cwd/$preves/win.rst x.rst
    fi

    pmemd.cuda -O -i prod.in -c x.rst -p HM.parm -r win.rst -o win.out -x win.nc -ref x.rst
done
