#!/bin/bash
cat > inrmsd.in <<EOD

parm active_1_parm.pdb [nc]
parm inactive_1_0ns.pdb [refparm]
trajin active_no_nek7.xtc 1 -1 parm [nc]
reference inactive_1_0ns.pdb parm [refparm] [refff]

rms :1-894@CA,C,N,O  ref [refff] :1-894@CA,C,N,O out rmsd.dat 
run
EOD
cpptraj -i inrmsd.in

