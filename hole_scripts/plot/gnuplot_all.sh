export zmin=`grep 'zmin' $system"_"$md_dir"_pore.dat" | awk '{print $4}'`
export output_f=$system"_"$md_dir"_pore" 
gnuplot plot_flags