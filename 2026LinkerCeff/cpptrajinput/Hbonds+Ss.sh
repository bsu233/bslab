#!/bin/bash
cat>1.in<<EOD
parm HM.parm
trajin prod.nc 1 -1 50
secstruct 3CD_3D-Ss :693-841 out 3CD_3D-Ss.dat sumout 3CD_3D-Ss.out assignout 3CD_3D-Ss.assign totalout 3CD_3D-Ss.totalout
hbond 3CD_3D out 3CD_3D-hbond2.dat :1-610,693-719 avgout avout2 series uuseries uuhbonds2.agr
run
EOD
cpptraj -i 1.in
rm 1.in           
