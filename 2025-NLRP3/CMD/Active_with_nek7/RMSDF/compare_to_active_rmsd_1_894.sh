#!/bin/bash
cat > rmsdf.in <<EOD

parm active_nek7_3_parm.pdb [nc]
parm active_nek7_1_0.pdb [refparm]
trajin active_with_nek7.xtc 1 -1   parm [nc]
reference active_nek7_1_0.pdb parm [refparm] [refff]

rms :1-894@CA,C,N,O ref [refff] :1-894@CA,C,N,O out compare_to_active_rmsd.dat 

run
EOD
cpptraj -i rmsdf.in

