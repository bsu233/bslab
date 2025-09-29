#!/bin/bash
cat>distancein1 <<EOD
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/nowater-ions-withjm.pdb
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/combtraj-5us-withjm.xtc 1 -1
rms tofirst :1-379@CA,C,N,O
distance :244@CA :258@CA out withjm-d1.dat
distance :96@CA :258@CA out withjm-d2.dat
run
EOD

source /opt/amber20/amber.sh

cpptraj -i distancein1
rm distancein1

cat>distancein2 <<EOD
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/nowater-ions-withoutjm.pdb
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/combtraj-5us-withoutjm.xtc 1 -1
rms tofirst :1-379@CA,C,N,O
distance :200@CA :214@CA out withoutjm-d1.dat
distance :52@CA :214@CA out withoutjm-d2.dat
run
EOD

source /opt/amber20/amber.sh

cpptraj -i distancein2
rm distancein2

