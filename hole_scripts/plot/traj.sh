source ~/Software/gromacs_4.6.5/bin/GMXRC
for system in 3RIF_IVM_from_md4  #3RHW_IVM_WT 3RHW_NL_WT 3RIF_GLU_IVM_WT
do
mkdir -p tmp_trj/$system
for md_dir in md1 #`ls -d ../$system\_md/*/ | grep '/md[1-5]/'| sed "s/..\/$system\_md\// /g"| sed "s/\// /g"| xargs`
do
mkdir -p tmp_trj/$system/$md_dir

trjconv -f ../$system\_md/$md_dir/4trjconv/*toGluClnoVSpdb_only_protein*.xtc -s 3RHW_WT_NL_princ_rotate_translate_noMN-MC.pdb -o tmp_trj/$system/$md_dir/$system\_$md_dir\_TM.xtc -n TMD -fit rot+trans -ur tric <<EOF
10
1
EOF
done
#rm pore_calc_$system.sh
#touch pore_calc_$system.sh
#echo "wd=\$(pwd)
#mkdir -p $system
#cd $system
#for i in md
#do
#mkdir -p \$i
#cd \$i
#rm -rf sph log dat
#vmd -dispdev text -e \$wd/pore_channel_xtc.tcl -args \$wd/3RHW_WT_NL_princ_rotate_translate_noMN-MC.pdb \$wd/tmp_trj/$system/\$i/$system\_\$i\_TM.xtc $system\_\$i\_pore.dat
#mkdir -p sph log dat
#mv *.sph sph/ 
#mv *.log log/
#mv [0-9]*.dat dat/
#rm $system\_\$i\_sph.tar.gz
#tar -cvf $system\_\$i\_sph.tar.gz sph
#rm -rf sph
#cd ../
#done
#" >> pore_calc_$system.sh
done
