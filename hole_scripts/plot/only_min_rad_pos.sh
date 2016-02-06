wd=$(pwd)
for system in 3RIF_IVM_from_md4 #3RHW_NL_WT 3RHW_IVM_WT 3RIF_GLU_IVM_WT 3RIF_IVM_fom_md4
do
cd $system
for i in `ls -d */ | grep 'md[1-5]'| sed "s/\// /g"| xargs`
do
cd $i/log
datadir=""
rm $system\_$i\_min-rad_only-pos.xvg
datadir="$wd/$system/$i/log/"
echo $datadir
export datadir
cp $wd/only_min_rad_pos.py .
python only_min_rad_pos.py | sort -n -k1 > $system\_$i\_min-rad_only-pos.xvg
cd $wd/$system
unset datadir
done
cd $wd
unset datadir
done