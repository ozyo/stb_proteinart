wd=$(pwd)
$VMD -dispdev text -e $wd/GluCl-TM2_tilt_top.tcl -args ../core_ref.pdb ../renumbered_aliTM1234.pdb M2_top
$VMD -dispdev text -e $wd/GluCl-TM2_tilt_bottom.tcl -args ../core_ref.pdb ../renumbered_aliTM1234.pdb M2_bottom
$VMD -dispdev text -e $wd/GluCl-TM2_tilt.tcl -args ../core_ref.pdb ../renumbered_aliTM1234.pdb M2_tilt