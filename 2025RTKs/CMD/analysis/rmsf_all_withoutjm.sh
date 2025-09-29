#!/bin/bash


cat>rmsftrajin1 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb [nc]
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb [refparm]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/1-withoutjm.xtc 1 -1 parm [nc]
reference /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb parm [refparm] [refff]
rms :1-335@CA,C,N,O ref [refff] :1-335@CA,C,N,O 
atomicfluct out 1_rmsf_withoutjm.dat :1-335@CA,C,N,O byres
run
EOD
source /opt/amber20/amber.sh
cpptraj -i rmsftrajin1
rm rmsftrajin1


cat>rmsftrajin2 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb [nc]
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb [refparm]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/2-withoutjm.xtc 1 -1 parm [nc]
reference /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb parm [refparm] [refff]
rms :1-335@CA,C,N,O ref [refff] :1-335@CA,C,N,O 
atomicfluct out 2_rmsf_withoutjm.dat :1-335@CA,C,N,O byres
run
EOD
source /opt/amber20/amber.sh
cpptraj -i rmsftrajin2
rm rmsftrajin2


cat>rmsftrajin3 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb [nc]
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb [refparm]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/3-withoutjm.xtc 1 -1 parm [nc]
reference /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb parm [refparm] [refff]
rms :1-335@CA,C,N,O ref [refff] :1-335@CA,C,N,O
atomicfluct out 3_rmsf_withoutjm.dat :1-335@CA,C,N,O byres
run
EOD
source /opt/amber20/amber.sh
cpptraj -i rmsftrajin3
rm rmsftrajin3


cat>rmsftrajin4 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb [nc]
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb [refparm]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/4-withoutjm.xtc 1 -1 parm [nc]
reference /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb parm [refparm] [refff]
rms :1-335@CA,C,N,O ref [refff] :1-335@CA,C,N,O
atomicfluct out 4_rmsf_withoutjm.dat :1-335@CA,C,N,O byres
run
EOD
source /opt/amber20/amber.sh
cpptraj -i rmsftrajin4
rm rmsftrajin4




cat>rmsftrajin5 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb [nc]
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb [refparm]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/5-withoutjm.xtc 1 -1 parm [nc]
reference /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withoutjm/nowater-ions-withoutjm.pdb parm [refparm] [refff]
rms :1-335@CA,C,N,O ref [refff] :1-335@CA,C,N,O
atomicfluct out 5_rmsf_withoutjm.dat :1-335@CA,C,N,O byres
run
EOD
source /opt/amber20/amber.sh
cpptraj -i rmsftrajin5
rm rmsftrajin5

