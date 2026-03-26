#!/bin/bash

cwd=`pwd`

for i in h11d4 h11h4 h11h4y101a h11h4y104f h11h4y104s
do
	cd $cwd/$i
	rm score.sc
	relax.linuxgccrelease -s $i.pdb -relax:ramp_constraints false -relax:constrain_relax_to_start_coords -ex1 -ex2aro -use_input_sc -flip_HNQ  -no_optH false
	mv ${i}_0001.pdb ${i}_relaxed.pdb
done
