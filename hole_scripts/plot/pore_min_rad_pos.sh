wd=$(pwd)
for system in 3RHW_NL_WT 3RHW_IVM_WT 3RIF_GLU_IVM_WT
do
cd $system
for i in `ls -d */ | grep 'md[1-5]'| sed "s/\// /g"| xargs`
do
cd $i/log
datadir=""
rm $system\_$i\_min-rad-pos.xvg
datadir="$wd/$system/$i/log/"
echo $datadir
export datadir
cp $wd/read_min_rad.py .
python read_min_rad.py | sort -n -k1 > $system\_$i\_min-rad-pos.xvg
cd $wd/$system
unset datadir
done
cd $wd
unset datadir
done