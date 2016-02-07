ref=$1
traj=$2
out=$3
$VMD -dispdev text -e traj_play_ss.tcl -args $ref $traj $out
./for_seq_log.sh