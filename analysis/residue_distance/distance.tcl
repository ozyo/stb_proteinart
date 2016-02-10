mol load pdb [lindex $argv 0] xtc [lindex $argv 1]

proc dist_traj { ch i res1 res2 } {
    set sel1 [atomselect 0 "resid $res1 and chain $ch" frame $i]
    set com1 [measure center $sel1]
    set sel2 [atomselect 0 "resid $res2 and chain $ch" frame $i]
    set com2 [measure center $sel2]
    return [veclength [vecsub $com1 $com2]]
}


set output [open [lindex $argv 2] w]
set type [lindex $argv 3]
set res1 [lindex $argv 4]
set res2 [lindex $argv 5]

set nf [molinfo top get numframes]

if { $type == "intrasubunit" } {
    for {set i 0} {$i < $nf} {incr i} {
	set distance_A [dist_traj A $i $res1 $res2]
	set distance_B [dist_traj B $i $res1 $res2]
	set distance_C [dist_traj C $i $res1 $res2]
	set distance_D [dist_traj D $i $res1 $res2]
	set distance_E [dist_traj E $i $res1 $res2]
	set avg_dist [expr ($distance_A + $distance_B + $distance_C + $distance_D + $distance_E)/5]
	puts $output $avg_dist 
    }
} else {
    puts "Sorry, type intersubunit not implemented yet"
}
close $output
quit