#!/bin/bash
cwd=`pwd`

for i in `seq 1 number`; do
        bash run_alphafold.sh -d /alpha_fold/data/ -o output/ -f sequence/output-new/$i.fasta -t 2025-11-01 -e false
	cp output/$i/ranked_0.pdb vhh$i.pdb
done

