#!/bin/bash


cwd=`pwd`

for i in `seq 1 95`
do
	relax.linuxgccrelease -s $i.pdb -relax:ramp_constraints false -relax:constrain_relax_to_start_coords -ex1 -ex2aro -use_input_sc -flip_HNQ  -no_optH false
	mv ${i}_0001.pdb ${i}_relaxed.pdb
	score_jd2.linuxgccrelease -s ${i}_relaxed.pdb -out:file:scorefile result.sc -no_optH false -overwrite -ignore_unrecognized_res
done
