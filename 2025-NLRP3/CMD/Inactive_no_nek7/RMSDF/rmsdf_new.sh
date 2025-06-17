#!/bin/bash

cat > rmsdf.in <<EOD
parm inactive_1_parm.pdb [refparm]
trajin /home/jinp/project/NLRP3/inactive_no_NEK7/MD1/inactive_1_chulihou.xtc 2 -1 
reference inactive_1_parm.pdb parm [refparm] [refff]
rms :1-894@CA,C,N,O [refff] :1-894@CA,C,N,O out rmsd_6npy_deletednek7_ADP.dat
atomicfluct out rmsf_6npy_deletednek7_ADP.dat :1-894@CA,C,N,O byres

run
EOD
cpptraj -i rmsdf.in
