#!/bin/bash
#SBATCH --job-name=erbb4jm    # Job name
#SBATCH --ntasks=1                     #
#SBATCH --ntasks-per-node=1            #
#SBATCH --cpus-per-task=8              #
#SBATCH --mem=20gb                     # Job memory request
#SBATCH --gres=gpu:1                   # GPU request 

source /public/home/sichao/APPs/gromacs2022/bin/GMXRC

gmx grompp -f nvt.mdp -c em.gro -r em.gro -p topol.top -o nvt.tpr -maxwarn 1

gmx mdrun -v -deffnm nvt

gmx grompp -f npt.mdp -c nvt.gro -r nvt.gro -t nvt.cpt -p topol.top -o npt.tpr -maxwarn 1

gmx mdrun -v -deffnm npt

gmx grompp -f md.mdp -c npt.gro -t npt.cpt -p topol.top -o md.tpr

gmx mdrun -deffnm md

