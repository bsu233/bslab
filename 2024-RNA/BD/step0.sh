#!/bin/bash


# RNA.pdb

grep "RNAA" step3_input.pdb > chainA.pdb


# lig.pdb shoule be generated by 
grep TEP step3_input.pdb > lig.pdb