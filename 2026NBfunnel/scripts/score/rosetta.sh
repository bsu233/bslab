#!/bin/bash


cwd=`pwd`

for i in `seq 1 95`
do
	sed 's/HIE/HIS/g' $i.pdb > temp1.pdb
	sed 's/CYX/CYS/g' temp1.pdb > temp2.pdb
	mv temp2.pdb $i.pdb
	rm temp1.pdb	
	relax.linuxgccrelease -s $i.pdb -relax:ramp_constraints false -relax:constrain_relax_to_start_coords -ex1 -ex2aro -use_input_sc -flip_HNQ  -no_optH false
	mv ${i}_0001.pdb ${i}_relaxed.pdb
	score_jd2.linuxgccrelease -s ${i}_relaxed.pdb -out:file:scorefile result.sc -no_optH false -overwrite -ignore_unrecognized_res
done
