mol load pdb [lindex $argv 0] xtc [lindex $argv 1]

set num_steps [molinfo top get numframes]

set ALL [atomselect top "protein and name CA" frame 0]
set COM_all [measure center $ALL weight mass]
set output_file [open [lindex $argv 2] w]
set vmdsel_TM [lindex $argv 3]
set vmdsel_EC [lindex $argv 4]
regsub -all {_} $vmdsel_TM " " vmdsel_TM
regsub -all {_} $vmdsel_EC " " vmdsel_EC

foreach ch in [list A B C D E]{
for {set frame 0} {$frame < $num_steps} {incr frame} {
    set TM_A [atomselect 0 "protein and chain A and $vmdsel_TM and name CA" frame $frame]
    set TM_B [atomselect 0 "protein and chain B and $vmdsel_TM and name CA" frame $frame]
    set TM_C [atomselect 0 "protein and chain C and $vmdsel_TM and name CA" frame $frame]
    set TM_D [atomselect 0 "protein and chain D and $vmdsel_TM and name CA" frame $frame]
    set TM_E [atomselect 0 "protein and chain E and $vmdsel_TM and name CA" frame $frame]

    set EC_A [atomselect 0 "protein and chain A and $vmdsel_EC and name CA" frame $frame]
    set EC_B [atomselect 0 "protein and chain B and $vmdsel_EC and name CA" frame $frame]
    set EC_C [atomselect 0 "protein and chain C and $vmdsel_EC and name CA" frame $frame]
    set EC_D [atomselect 0 "protein and chain D and $vmdsel_EC and name CA" frame $frame]
    set EC_E [atomselect 0 "protein and chain E and $vmdsel_EC and name CA" frame $frame]
    
    set COM_eca [measure center $EC_A weight mass]
    set COM_tma [measure center $TM_A weight mass]
    set COM_tma [lreplace $COM_tma 2 2 [lindex $COM_all 2]]
    set COM_eca [lreplace $COM_eca 2 2 [lindex $COM_all 2]]
    set vec1 [vecsub $COM_eca $COM_all]
    set vec2 [vecsub $COM_tma $COM_all]
    set dotprod_a [vecdot $vec1 $vec2]
    set angle_A [ expr 57.2958 * acos($dotprod_a / ([veclength $vec1] * [veclength $vec2]))]

    set COM_eca [measure center $EC_B weight mass]
    set COM_tma [measure center $TM_B weight mass]
    set COM_tma [lreplace $COM_tma 2 2 [lindex $COM_all 2]]
    set COM_eca [lreplace $COM_eca 2 2 [lindex $COM_all 2]]
    set vec1 [vecsub $COM_eca $COM_all]
    set vec2 [vecsub $COM_tma $COM_all]
    set dotprod_a [vecdot $vec1 $vec2]
    set angle_B [ expr 57.2958 * acos($dotprod_a / ([veclength $vec1] * [veclength $vec2]))]

    set COM_eca [measure center $EC_C weight mass]
    set COM_tma [measure center $TM_C weight mass]
    set COM_tma [lreplace $COM_tma 2 2 [lindex $COM_all 2]]
    set COM_eca [lreplace $COM_eca 2 2 [lindex $COM_all 2]]
    set vec1 [vecsub $COM_eca $COM_all]
    set vec2 [vecsub $COM_tma $COM_all]
    set dotprod_a [vecdot $vec1 $vec2]
    set angle_C [ expr 57.2958 * acos($dotprod_a / ([veclength $vec1] * [veclength $vec2]))]

    set COM_eca [measure center $EC_D weight mass]
    set COM_tma [measure center $TM_D weight mass]
    set COM_tma [lreplace $COM_tma 2 2 [lindex $COM_all 2]]
    set COM_eca [lreplace $COM_eca 2 2 [lindex $COM_all 2]]
    set vec1 [vecsub $COM_eca $COM_all]
    set vec2 [vecsub $COM_tma $COM_all]
    set dotprod_a [vecdot $vec1 $vec2]
    set angle_D [ expr 57.2958 * acos($dotprod_a / ([veclength $vec1] * [veclength $vec2]))]

    set COM_eca [measure center $EC_E weight mass]
    set COM_tma [measure center $TM_E weight mass]
    set COM_tma [lreplace $COM_tma 2 2 [lindex $COM_all 2]]
    set COM_eca [lreplace $COM_eca 2 2 [lindex $COM_all 2]]
    set vec1 [vecsub $COM_eca $COM_all]
    set vec2 [vecsub $COM_tma $COM_all]
    set dotprod_a [vecdot $vec1 $vec2]
    set angle_E [ expr 57.2958 * acos($dotprod_a / ([veclength $vec1] * [veclength $vec2]))]
    
    set avg [expr ($angle_A+ $angle_B + $angle_C + $angle_D + $angle_E)/ 5]

    puts $output_file "$frame $avg $angle_A $angle_B $angle_C $angle_D $angle_E"
}
close $output_file

quit