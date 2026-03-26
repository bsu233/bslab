#!/bin/bash

cwd=`pwd`

for i in h11d4 h11h4 h11h4y101a h11h4y104f h11h4y104s
do
	cd $cwd/$i
	docking_prepack_protocol.linuxgccrelease -s ${i}_relaxed.pdb -dock_rtmin -docking:sc_min
	mv ${i}_relaxed_0001.pdb ${i}_prepacked.pdb

done
