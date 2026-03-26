#!/bin/bash


cat > rmsdfin <<EOD
parm HM.parm [nc]
parm 2p42.pdb [refparm]
trajin prod.nc 1 -1 parm [nc]
reference 2p42.pdb parm [refparm] [refff]
rms :1-245@CA,C,N,O ref [refff] :1-245@CA,C,N,O out rmsd.dat
atomicfluct out rmsf.dat :1-245@CA,C,N,O byres

run
EOD
cpptraj.cuda -i rmsdfin

