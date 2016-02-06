wd=$(pwd)
for system in 3RHW_IVM_WT #3RIF_GLU_IVM_WT 
#3RHW_IVM_WT 
do
cd $system
#for 3RIF_GLU_IVM
#for i in "md1 798" "md2 796" "md3 778" "md4 810" "md5 797"
#for 3RHW_IVM
for i in "md1 733" "md2 810" "md3 840" "md4 763" "md5 780"
do
set -- $i
rm $system\_$1\_$2\ns.dat
rm $system\_$1\_$2\ns.xvg
cd $1/log
datadir=""
datadir="$wd/$system/$1/log/"
echo $datadir
export datadir
time=""
time=$2
time=`expr $((time-1))`
echo $time
export time
cp $wd/read_frame.py .
python read_frame.py > $system\_$1\_$2\ns.dat
sort -n -k1 $system\_$1\_$2\ns.dat | awk '{print $1-47,$2}' > $system\_$1\_$2\ns.xvg
cd $wd/$system
unset datadir
unset time
done
cd $wd
unset datadir
unset time
done
