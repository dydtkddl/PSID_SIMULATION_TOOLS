gmx pdb2gmx -f case_001.pdb -o processed.gro -p topol.top -ff oplsaa -water tip3p -ter
gmx editconf -f processed.gro -o newbox.gro -c -d 1.0 -bt cubic
gmx solvate -cp newbox.gro -cs spc216.gro -o solvated.gro -p topol.top
gmx grompp -f em.mdp -c solvated.gro -p topol.top -o em.tpr

