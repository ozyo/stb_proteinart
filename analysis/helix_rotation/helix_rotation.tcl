mol load pdb [lindex $argv 0]
mol load pdb [lindex $argv 0] xtc [lindex $argv 1]


proc angle { a b } {
    set amag [veclength $a]
    set bmag [veclength $b]
    set dotprod [vecdot $a $b]
    return [expr 57.2958 * acos($dotprod / ($amag * $bmag))]
}

package require Orient
namespace import Orient::orient

set sel [atomselect 0 "chain A and name CA"]
set I [draw principalaxes $sel]
set A [orient $sel [lindex $I 2] {0 0 1}]
[atomselect 0 all] move $A
set I [draw principalaxes $sel]

set ref [atomselect 0 "name O and resid 9 to 134 and protein and chain A"]
set to_move [atomselect 1 "name O and resid 9 to 134 and protein and chain A"]
set trans_mat [measure fit $to_move $ref]
[atomselect 1 all] move $trans_mat

set sel_h1 [atomselect 0 "name CA and resid 179 to 195 and chain A"]
set I_hel_1 [draw principalaxes $sel_h1]

set sel_h2 [atomselect 1 "name CA and resid 179 to 195 and chain A"]
set I_hel_2 [draw principalaxes $sel_h2]

set dot1 [vecdot  [lindex $I_hel_1 2] [lindex $I 2]]
set hel1 [vecsub [lindex $I_hel_1 2] [vecscale $dot1 [lindex $I 2]]]


set dot2 [vecdot  [lindex $I_hel_2 2] [lindex $I 2]]
set hel2 [vecsub [lindex $I_hel_2 2] [vecscale $dot2 [lindex $I 2]]]

set rot [angle $hel1 $hel2]
puts "Helix rotates $rot"

quit