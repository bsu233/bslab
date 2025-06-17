#!/bin/bash
cat > inrmsd.in <<EOD

parm 3_parm.pdb [nc]
parm inactive_1_0ns.pdb [refparm]
trajin transition_no_nek7.xtc 1 -1 9 parm [nc]
reference inactive_1_0ns.pdb parm [refparm] [refff]

rms :1-894@CA,C,N,O  ref [refff] :1-894@CA,C,N,O out rmsd.dat 
run
EOD
cpptraj -i inrmsd.in

