cat>rmsftrajin1 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb [nc]
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb [refparm]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/1-withjm.xtc 1 -1 parm [nc]
reference /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb parm [refparm] [refff]
rms :45-379@CA,C,N,O ref [refff] :45-379@CA,C,N,O 
atomicfluct out 1_rmsf_withjm.dat :45-379@CA,C,N,O byres
run
EOD
source /opt/amber20/amber.sh
cpptraj -i rmsftrajin1
rm rmsftrajin1



cat>rmsftrajin2 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb [nc]
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb [refparm]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/2-withjm.xtc 1 -1 parm [nc]
reference /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb parm [refparm] [refff]
rms :45-379@CA,C,N,O ref [refff] :45-379@CA,C,N,O
atomicfluct out 2_rmsf_withjm.dat :45-379@CA,C,N,O byres
run
EOD
source /opt/amber20/amber.sh
cpptraj -i rmsftrajin2
rm rmsftrajin2



cat>rmsftrajin3 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb [nc]
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb [refparm]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/3-withjm.xtc 1 -1 parm [nc]
reference /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb parm [refparm] [refff]
rms :45-379@CA,C,N,O ref [refff] :45-379@CA,C,N,O
atomicfluct out 3_rmsf_withjm.dat :45-379@CA,C,N,O byres
run
EOD
source /opt/amber20/amber.sh
cpptraj -i rmsftrajin3
rm rmsftrajin3



cat>rmsftrajin4 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb [nc]
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb [refparm]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/4-withjm.xtc 1 -1 parm [nc]
reference /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb parm [refparm] [refff]
rms :45-379@CA,C,N,O ref [refff] :45-379@CA,C,N,O
atomicfluct out 4_rmsf_withjm.dat :45-379@CA,C,N,O byres
run
EOD
source /opt/amber20/amber.sh
cpptraj -i rmsftrajin4
rm rmsftrajin4




cat>rmsftrajin5 <<EOD

parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb [nc]
parm /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb [refparm]
trajin /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/5-withjm.xtc 1 -1 parm [nc]
reference /home/xhchen/VEGFR2/cmd-withJM_withoutJM/analysis/traj-subsection/withjm/nowater-ions-withjm.pdb parm [refparm] [refff]
rms :45-379@CA,C,N,O ref [refff] :45-379@CA,C,N,O
atomicfluct out 5_rmsf_withjm.dat :45-379@CA,C,N,O byres
run
EOD
source /opt/amber20/amber.sh
cpptraj -i rmsftrajin5
rm rmsftrajin5




