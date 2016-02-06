wd=$(pwd)
for pdb in `ls -1 $wd/../xtc_files/*/*TM1234.pdb | egrep "4TNV" `
#for pdb in `ls -1 $wd/../Ed_sim/*TM1234.pdb`
do
name=${pdb%.pdb}
$VMD2 -dispdev text -e $wd/distance.tcl -args $name ${name##*/}
done