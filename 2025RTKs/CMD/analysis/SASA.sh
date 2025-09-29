#!/bin/bash

source /opt/amber20/amber.sh


cat>sasa1 <<EOD
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/nowater-ions-withoutjm.pdb [nc]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/combtraj-5us-withoutjm.xtc 1 -1 parm [nc]
surf :5,7,15,17,33-35,52,55,56,59,66,81-86,88-90,194,202,212-214 out surf_4agc_nojm.dat
#surf :1-335 out surf_all.dat
run
EOD

cpptraj -i sasa1
rm sasa1


cat>sasa2 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/nowater-ions-withjm.pdb [nc]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/combtraj-5us-withjm.xtc 1 -1 parm [nc]
surf :49,51,59,61,77-79,96,99-100,103,110,125-130,132-134,238,246,256-258 out surf_pocket_jm.dat
run
EOD
source /opt/amber20/amber.sh
cpptraj -i sasa2

rm sasa2

