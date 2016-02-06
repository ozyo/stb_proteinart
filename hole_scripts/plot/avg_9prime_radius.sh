wd=$(pwd)
for system in 3RIF_IVM_from_md4 #3RHW_NL_WT 3RHW_IVM_WT 3RIF_GLU_IVM_WT
do
cd $system
for i in md1 md2 md3 md4 md5
do
cd $i/log
rm avg_9prime_radius.dat
datadir=""
datadir="$wd/$system/$i/log/"
echo $datadir
export datadir
cp $wd/avg_9prime_radius.py .
python avg_9prime_radius.py
echo '@TYPE xydy' > $system\_$i\_9prime.xvg
sort -n -k 1 avg_9prime_radius.dat >> $system\_$i\_9prime.xvg
cd $wd/$system
unset datadir
done
cd $wd
unset datadir
done
