#!/bin/bash
#3CD
# Calculate the distance for motifA(411-418) between motifC(511-517) 

cat>distance.in<<EOD
parm /home/jinp/project/NLRP3/active_with_NEK7/active_nek7_1_parm.pdb
trajin /home/jinp/project/NLRP3/active_with_NEK7/active_nek7_1_chulihou.xtc
rms tofirst :1-894@CA,C,N,O 
rms fit :1-558,559-894
distance motifA-B :1-558&!@H= :559-894&!@H= out active_nek7_motifA-B.dat
run
EOD


cpptraj -i distance.in
rm distance.in
 
