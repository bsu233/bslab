#!/bin/bash

cwd=`pwd`


for i in h11d4 h11h4 h11h4y101a h11h4y104f h11h4y104s
do
	cd $cwd/$i
	docking_protocol.linuxgccrelease -s ${i}_prepacked.pdb -ignore_unrecognized_res -ex1 -ex2aro -dock_pert 3 8 -nstruct 1000 -score:docking_interface_score 1 -out:file:scorefile score_docking.sc
done
