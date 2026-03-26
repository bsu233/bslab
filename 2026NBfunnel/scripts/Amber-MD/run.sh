#!/bin/bash

pmemd.cuda -O -i min.in -c rst7 -p parm7 -r min.rst -o min.out -ref rst7 -inf min.info
pmemd.cuda -O -i heat1.in -c min.rst -p parm7 -r heat1.rst -o heat1.out -x heat1.nc -ref min.rst -inf heat1.info
pmemd.cuda -O -i heat2.in -c heat1.rst -p parm7 -r heat2.rst -o heat2.out -x heat2.nc -ref heat1.rst -inf heat2.info
pmemd.cuda -O -i equi.in -c heat2.rst -p HM.parm -r equi.rst -o equi.out -x equi.nc -ref heat2.rst -inf equi.info
pmemd.cuda -O -i prod.in -c equi.rst -p HM.parm -r prod.rst -o prod.out -x prod.nc -ref equi.rst -inf prod.info
