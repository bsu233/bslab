#!/bin/bash

cwd=`pwd`

for i in `cat 2p4xlist`
do
        cd $cwd/$i/
	cp $cwd/pack_input_options.txt .
        InterfaceAnalyzer.linuxgccrelease -s ${i}_relaxed.pdb -no_optH false -ignore_unrecognized_res @pack_input_options.txt -out:file:scorefile interfacemdresult.sc
done

