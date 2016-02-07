mol load pdb [lindex $argv 0] xtc [lindex $argv 1]

set output [open [lindex $argv 2] w]
set type [lindex $argv 3]
set res1 [lindex $argv 4]
set res2 [lindex $argv 5]

set nf [molinfo top get numframes]

if {$type == "intrasubunit"}{
for {set i 0} {$i < $nf} {incr i} {
    foreach x [list 1 2 3 4 5] y [list 1 2 3 4 5] ch [list A B C D E]{
    set sel$x [atomselect 0 "resid $res1 and chain $ch" frame $i]
    set com$x [measure center [set sel$x]]
    set sel$y [atomselect 0 "resid $res2 and chain $ch" frame $i]
    set com$y [measure center [set sel$y]]

    set distance_A [veclength [vecsub $com1 $com2]]
    set distance_B [veclength [vecsub $com3 $com4]]
    set distance_C [veclength [vecsub $com5 $com6]]
    set distance_D [veclength [vecsub $com8 $com7]]
    set distance_E [veclength [vecsub $com9 $com10]]
    set avg_dist [expr ($distance_A + $distance_B + $distance_C + $distance_D + $distance_E)/5]

    puts $output $avg_dist
    } 
} else {
    puts "Sorry, type intersubunit not implemented yet"
}
close $output
quit