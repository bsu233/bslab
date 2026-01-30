#!/bin/bash


# hydrogen mass repartition to enable a 4fs time step

cat > parmedCMD << EOD

HMassRepartition

outparm ag_HM.prmtop

EOD


parmed -i parmedCMD ag.prmtop

