wd=$(pwd)
for system in 3RIF_IVM_from_md4 #3RHW_IVM_WT 3RHW_NL_WT 3RIF_GLU_IVM_WT
do
cd $system
for md_dir in `ls -d * | grep 'md[1-5]'| xargs`
do
cd $md_dir
cp $wd/gnuplot_GluCl .
export zmin=`grep 'zmin' $system"_"$md_dir"_pore.dat" | awk '{print $4}'`
export output_f=$system"_"$md_dir"_pore" 
gnuplot gnuplot_GluCl
cd $wd/$system/
done
cd $wd
done