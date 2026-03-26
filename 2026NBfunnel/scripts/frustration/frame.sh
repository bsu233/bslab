#!/bin/bash

cwd=`pwd`



for i in `seq 1 100`
do
	echo "parm parm7" >>framein
	echo "trajin align.nc $i $i" >>framein
	echo "strip !:1-245" >>framein
	echo "trajout pdb$i.pdb" >> framein
	cpptraj.cuda -i framein
	mv pdb$i.pdb pdbs
	rm framein
done
