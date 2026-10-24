#!/bin/bash

cat > rmsdf.in <<EOD
parm no-waterstep3_charmm2gmx.pdb [nc]
parm no-water3u88.pdb [refparm]
trajin md5000_1-10.xtc parm  [nc] 
reference no-water3u88.pdb parm [refparm] [refff]

rms :83-100,801-820@BB ref [refff] :80-97,594-613@BB out rmsd-IDR1-5000-men-mll.dat

rms :801-820,657-668,673-690@BB ref [refff] :594-613,524-535,540-557@BB out rmsd-IDR1-5000-led3-mll3.dat

#atomicfluct out rmsf.dat :1-841@CA,C,N,O byres

run
EOD
cpptraj -i rmsdf.in
rm rmsdf.in
