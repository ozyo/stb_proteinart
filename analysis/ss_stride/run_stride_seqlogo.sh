system=SS_GLU_IVM_WT_DOPC
dfile=$system
$VMD -dispdev text -e traj_play_ss.tcl -args ../GluCl_noVS_ch_label.pdb ../*_only_protein.xtc $dfile
./for_seq_log.sh