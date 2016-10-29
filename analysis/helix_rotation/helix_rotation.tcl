#This script calculates the domain rotation in CAP. To be more accurate it calculates the rotation of a helix in one domain, relative to another domain. 
# I don't have an example for this system since I wrote it for Ahmet Yildirim's data on CAP. But it should work fine, since I tested it with crystal structures.

mol load pdb [lindex $argv 0].pdb
mol load pdb [lindex $argv 1].pdb xtc [lindex $argv 2].xtc

proc angle { a b } {
    set amag [veclength $a]
    set bmag [veclength $b]
    set dotprod [vecdot $a $b]
    return [expr 57.2958 * acos($dotprod / ($amag * $bmag))]
}

set nf [molinfo top get numframes]

package require Orient
namespace import Orient::orient
foreach ch [list A B] {
    #this is the definition of the reference we don't need to update this by time so moved up
    #we select the chain and fit that chain only to its principal axes. 
    #This operation is still dependent on the chain so we keep it within the chain loop
    set sel [atomselect 0 "chain $ch and name CA"]
    set I [draw principalaxes $sel]
    set A [orient $sel [lindex $I 2] {0 0 1}]
    [atomselect 0 all] move $A
    set I [draw principalaxes $sel]
    set ref [atomselect 0 "name O and resid 9 to 134 and protein and chain $ch"]
    set sel_h1 [atomselect 0 "name CA and resid 179 to 195 and chain $ch"]
    set I_hel_1 [draw principalaxes $sel_h1]
    #define reference axis
    set dot1 [vecdot  [lindex $I_hel_1 2] [lindex $I 2]]
    set hel1 [vecsub [lindex $I_hel_1 2] [vecscale $dot1 [lindex $I 2]]]
    
    set output [open CAP_domain_angle_$ch.dat w]
    for {set i 0} {$i < $nf} {incr i} {
	#move the frame into the reference
	set to_move [atomselect 1 "name O and resid 9 to 134 and protein and chain $ch" frame $i]
	set trans_mat [measure fit $to_move $ref]
	[atomselect 1 all] move $trans_mat
	#draw axes
	set sel_h2 [atomselect 1 "name CA and resid 179 to 195 and chain $ch" frame $i]
	set I_hel_2 [draw principalaxes $sel_h2]
	#define traj axis
	set dot2 [vecdot  [lindex $I_hel_2 2] [lindex $I 2]]
	set hel2 [vecsub [lindex $I_hel_2 2] [vecscale $dot2 [lindex $I 2]]]

	set rot [angle $hel1 $hel2]
	puts "$i $rot"
    }
    close $output
}

quit