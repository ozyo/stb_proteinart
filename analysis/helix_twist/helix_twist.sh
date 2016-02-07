ref=$1
traj=$2
out=$3
sel=$4
$VMD -dispdev text -e helix_twist.tcl -args $ref $traj $out $sel
