#!/bin/bash
cat>distanceinjm <<EOD
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/nowater-ions-withjm.pdb [nc]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/combtraj-5us-withjm.xtc 1 -1 parm [nc]
rms tofirst :1-379@CA,C,N,O
distance :79@NZ :96@CD out distance_NZ-CD_jm.dat
run
EOD

source /opt/amber20/amber.sh

cpptraj -i distanceinjm
rm distanceinjm


cat>distanceinnojm<<EOD
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/nowater-ions-withoutjm.pdb [nc]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/combtraj-5us-withoutjm.xtc 1 -1 parm [nc]
rms tofirst :1-379@CA,C,N,O
distance :35@NZ :52@CD out distance_NZ-CD_nojm.dat
run
EOD

source /opt/amber20/amber.sh

cpptraj -i distanceinnojm
rm distanceinnojm



