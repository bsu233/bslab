#!/bin/bash

cwd=`pwd`

for i in  h11d4 h11h4 h11h4y101a h11h4y104f h11h4y104s
do
	cd $cwd/$i
	awk '{if(NR>2)printf "%8s    %8s\n",$3,$6}' score_docking.sc > rms_isc.dat
	sort -n -k 6 score_docking.sc > paixu.dat
	awk '{if(NR<11)printf "%8s    %8s\n",$3,$6}' paixu.dat > red.dat
done
