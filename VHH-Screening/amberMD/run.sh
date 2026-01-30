#!/bin/bash

pmemd -O -i input/min.in -c ag.inpcrd -p ag_HM.prmtop -r output1/min.rst -o output1/min.out -ref ag.inpcrd
pmemd.cuda -O -i input/heat1.in -c output1/min.rst -p ag_HM.prmtop -r output1/heat1.rst -o output1/heat1.out -x output1/heat1.nc -ref output1/min.rst
pmemd.cuda -O -i input/heat2.in -c output1/heat1.rst -p ag_HM.prmtop -r output1/heat2.rst -o output1/heat2.out -x output1/heat2.nc -ref output1/heat1.rst
pmemd.cuda -O -i input/equi.in -c output1/heat2.rst -p ag_HM.prmtop -r output1/equi.rst -o output1/equi.out -x output1/equi.nc -ref output1/heat2.rst
pmemd.cuda -O -i input/prod.in -c output1/equi.rst -p ag_HM.prmtop -r output1/prod.rst -o output1/prod.out -x output1/prod.nc


