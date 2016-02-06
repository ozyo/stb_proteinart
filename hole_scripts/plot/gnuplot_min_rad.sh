wd=$(pwd)
for system in 3RIF_noIVM_L174A 3RIF_noIVM_L174E 3RIF_noIVM_L174G 3RIF_noIVM_L174P  3RHW_IVM_WT 3RHW_WT_NL 3RIF_GLU_IVM_WT 3RIF_noIVM_WT
do
cd $system
for md_dir in `ls -d * | grep 'md'| xargs`
do
cd $md_dir/log
cp $wd/gnuplot_min_rad .
export output_f=$system"_"$md_dir"_min-rad-pos"
gnuplot gnuplot_min_rad
cd ../../
done
cd $wd
done