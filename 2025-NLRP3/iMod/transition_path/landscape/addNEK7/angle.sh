#!/bin/bash

cat > inrmsd.in <<EOD
parm 190_50ns.pdb [nc]
trajin transition_add_nek7.xtc 1 -1 3  parm [nc]

rms tofirst :1-894@CA,C,N,O 
angle A16_4833_14227 @16 @4833 @14227 out A16_4833_14227.agr
run
EOD
cpptraj -i inrmsd.in

