#!/bin/bash

# extact the ptm sites information from the downloaded PSP dataset


# !!! regardless of number of recordings reporting the phosphorylation site !!!
# !!! only human  !!!


awk '{ if ( $2 == "LMOD2" ) print }' Phosphorylation_site_dataset  | grep human | grep "\-p" | awk -F "-p" '{ print $1 }'| awk '{ print $NF }' | sort -k 1 -g | uniq > lmod2
awk '{ if ( $2 == "MYOT" ) print }' Phosphorylation_site_dataset  | grep human | grep "\-p" | awk -F "-p" '{ print $1 }'| awk '{ print $NF }' | sort -k 1 -g | uniq > myot
awk '{ if ( $2 == "NEB" ) print }' Phosphorylation_site_dataset  | grep human | grep "\-p" | awk -F "-p" '{ print $1 }'| awk '{ print $NF }' | sort -k 1 -g | uniq > neb
awk '{ if ( $2 == "MYPN" ) print }' Phosphorylation_site_dataset  | grep human | grep "\-p" | awk -F "-p" '{ print $1 }'| awk '{ print $NF }' | sort -k 1 -g | uniq > mypn
awk '{ if ( $2 == "PDLIM5" ) print }' Phosphorylation_site_dataset  | grep human | grep "\-p" | awk -F "-p" '{ print $1 }'| awk '{ print $NF }' | sort -k 1 -g | uniq > enh2
