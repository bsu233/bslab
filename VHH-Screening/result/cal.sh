#!/bin/bash
cwd=`pwd`
ag="xx"
for vhh in $(ls -d -v */);do
	for rep in `seq 1 3` ; do
		for i in `seq 1 10`;do
			work="$vhh/${ag}_${rep}/$i"
			if [ -f "$work/FINAL_RESULTS_MMPBSA.dat" ]; then
				value=$(tail -5 $work/FINAL_RESULTS_MMPBSA.dat | head -1 | awk '{print $3}')
				echo "pose$i.pdb      $value" >> $vhh/${ag}_${rep}/MMGBSA.out
			else
				echo "error : $work/FINAL_RESULTS_MMPBSA.dat not found"
			fi
		done
		line_count=$(wc -l < "$vhh/${ag}_${rep}/MMGBSA.out")
		if [ "$line_count" -lt 10 ]; then
			echo "Error $vhh/${ag}_${rep}/MMGBSA is found error" >> MMGBSAerror.dat
			sort -k2 -n -o "$vhh/${ag}_${rep}/MMGBSA.out" "$vhh/${ag}_${rep}/MMGBSA.out"
		else
			sort -k2 -n -o "$vhh/${ag}_${rep}/MMGBSA.out" "$vhh/${ag}_${rep}/MMGBSA.out"
		fi
		average=$(head -n 3 "$vhh/${ag}_${rep}/MMGBSA.out" | awk '{sum+=$2} END {print sum/NR}')
		echo "${ag}_${rep}    $average" >> $vhh/MMGBSA.out
	done
	vhhaverage=$(head -n 3 "$vhh/MMGBSA.out" | awk '{sum+=$2} END {print sum/NR}')
	echo "$vhh     $vhhaverage" >> MMGBSA.out

done
sort -k2 -n -o MMGBSA.out MMGBSA.out
