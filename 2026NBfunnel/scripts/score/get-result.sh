#!/bin/bash

cwd=`pwd`

for i in 2p42 2p43 2p44 2p45 2p46 2p47 2p48 2p49 2p4a
do
	cd $cwd/$i
	if [[ -f score_summary_gmx.txt && -s score_summary_gmx.txt ]];then
		bach=`grep 'Score' score_summary_gmx.txt | awk -F ":" '{print $3}'`
		pisa=`awk -F ":" '{print $4}' score_summary_gmx.txt`
		zrank=`awk -F ":" '{print $5}' score_summary_gmx.txt`
		irad=`awk -F ":" '{print $6}' score_summary_gmx.txt`
		firedock=`awk -F ":" '{print $7}' score_summary_gmx.txt`
		bmfbluues=`awk -F ":" '{print $8}' score_summary_gmx.txt`
	else
		bach="NaN"
		pisa="NaN"
		zrank="NaN"
		irad="NaN"
		firedock="NaN"
		bmfbluues="NaN"
	fi
	echo "$i $bach" >> $cwd/result/bach-result
	echo "$i $pisa" >> $cwd/result/pisa-result
	echo "$i $zrank" >> $cwd/result/zrank-result
	echo "$i $irad" >> $cwd/result/irad-result
	echo "$i $firedock" >> $cwd/result/firedock-result
	echo "$i $bmfbluues" >> $cwd/result/bmfbluues-result
done
