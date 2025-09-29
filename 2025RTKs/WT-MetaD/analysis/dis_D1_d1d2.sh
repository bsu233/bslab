#/bin/bash
cat>distancein<<EOD
parm ../../nowater-ions.pdb
trajin ../../4agc-jm.xtc 
rms tofirst :1-368@CA,C,N,O
distance :1@O :249@N out R1.dat
distance :5@N :225@O out r1.dat
distance :5@O :225@N out r2.dat
run
EOD

source /opt/amber20/amber.sh

cpptraj -i distancein
rm distancein
