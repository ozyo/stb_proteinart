wd=$(pwd)
for system in 3RHW_NL_WT 3RHW_IVM_WT 3RIF_GLU_IVM_WT
do
cd $system
for i in md1 md2 md3 md4 md5
do
cd $i/log
datadir=""
rm $system\_$i\_rad4.5Angs.???
datadir="$wd/$system/$i/log/"
echo $datadir
export datadir
cp $wd/read_log.py .
python read_log.py > $system\_$i\_rad4.5Angs.dat
sort -n -k 1 $system\_$i\_rad4.5Angs.dat > $system\_$i\_rad4.5Angs.xvg
cd $wd/$system
unset datadir
done
cd $wd
unset datadir
done