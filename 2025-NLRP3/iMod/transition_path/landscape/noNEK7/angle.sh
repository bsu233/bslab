#!/bin/bash

cat > inrmsd.in <<EOD
parm active_1_0ns.pdb [nc]
trajin active_no_nek7.xtc 1 -1   parm [nc]

rms tofirst :1-894@CA,C,N,O 
angle A16_4833_14227 @16 @4833 @14227 out A16_4833_14227.agr
run
EOD
cpptraj -i inrmsd.in

