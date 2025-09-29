#!/bin/bash




cat>angle1 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/nowater-ions-withoutjm.pdb [nc]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/combtraj-5us-withoutjm.xtc 1 -1 parm [nc]
angle 1 @852 @3363 @3018 out without-jm-angle_rspine.dat
run
EOD
source /opt/amber20/amber.sh
cpptraj -i angle1

rm angle1



cat>angle2 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/nowater-ions-withjm.pdb [nc]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/combtraj/combtraj-5us-withjm.xtc 1 -1 parm [nc]
angle 2 @1557 @4068 @3723 out with-jm-angle_rspine.dat
run
EOD
source /opt/amber20/amber.sh
cpptraj -i angle2

rm angle2


