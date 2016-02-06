mol load pdb [lindex $argv 0].pdb
set output [open [lindex $argv 1].dat w]

set nf [molinfo top get numframes]

for {set i 0} {$i < $nf} {incr i} {

    set sel1 [atomselect 0 "resid 66 and chain A" frame $i]
    set com1 [measure center $sel1]
    set sel2 [atomselect 0 "resid 63 and chain D" frame $i]
    set com2 [measure center $sel2]

    set sel3 [atomselect 0 "resid 66 and chain B" frame $i]
    set com3 [measure center $sel3]
    set sel4 [atomselect 0 "resid 63 and chain E" frame $i]
    set com4 [measure center $sel4]

    set sel5 [atomselect 0 "resid 66 and chain C" frame $i]
    set com5 [measure center $sel5]
    set sel6 [atomselect 0 "resid 63 and chain A" frame $i]
    set com6 [measure center $sel6]

    set sel7 [atomselect 0 "resid 66 and chain D" frame $i]
    set com7 [measure center $sel7]
    set sel8 [atomselect 0 "resid 63 and chain B" frame $i]
    set com8 [measure center $sel8]

    set sel9 [atomselect 0 "resid 66 and chain E" frame $i]
    set com9 [measure center $sel9]
    set sel10 [atomselect 0 "resid 63 and chain C" frame $i]
    set com10 [measure center $sel10]


    set distance_A [veclength [vecsub $com1 $com2]]
    set distance_B [veclength [vecsub $com3 $com4]]
    set distance_C [veclength [vecsub $com5 $com6]]
    set distance_D [veclength [vecsub $com8 $com7]]
    set distance_E [veclength [vecsub $com9 $com10]]
    set avg_dist [expr ($distance_A + $distance_B + $distance_C + $distance_D + $distance_E)/5]

    puts $output $avg_dist
} 

close $output
quit