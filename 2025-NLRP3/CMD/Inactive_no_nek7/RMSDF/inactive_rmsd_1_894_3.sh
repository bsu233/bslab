#!/bin/bash
cat > inrmsd.in <<EOD

parm inactive_1_new_new.pdb [nc]
parm inactive_1_0ns.pdb [refparm]
trajin inactive_no_nek7_new.xtc 1 -1 parm [nc]
reference inactive_1_0ns.pdb parm [refparm] [refff]

rms :1-894@CA,C,N,O  ref [refff] :1-894@CA,C,N,O out rmsd.dat 
run
EOD
cpptraj -i inrmsd.in

