ref=$1
traj=$2
out=$3
TM_sel=$4
EC_sel=$5

$VMD -dispdev text -e $STB/analysis/domain-twist/EC-TM_twist.tcl -args $ref $traj $out $TM_sel $EC_sel