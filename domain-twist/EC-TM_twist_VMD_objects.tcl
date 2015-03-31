set ALL [atomselect 2 "protein and name CA"]
set COM_all [measure center $ALL weight mass]
#set TM_A [atomselect 0 "protein and chain A and resid 211 to 339 and name CA" ]
#set TM_B [atomselect 0 "protein and chain B and resid 211 to 339 and name CA" ]
#set TM_C [atomselect 0 "protein and chain C and resid 211 to 339 and name CA" ]
set TM_D [atomselect 0 "protein and chain D and resid 211 to 339 and name CA" ]
#set TM_E [atomselect 0 "protein and chain E and resid 211 to 339 and name CA" ]

#set EC_A [atomselect 0 "protein and chain A and resid 1 to 211 and name CA" ]
#set EC_B [atomselect 0 "protein and chain B and resid 1 to 211 and name CA" ]
#set EC_C [atomselect 0 "protein and chain C and resid 1 to 211 and name CA" ]
set EC_D [atomselect 0 "protein and chain D and resid 1 to 211 and name CA" ]
#set EC_E [atomselect 0 "protein and chain E and resid 1 to 211 and name CA" ]

# set COM_ece [measure center $EC_E weight mass]
# set COM_tme [measure center $TM_E weight mass]
# set COM_tme [lreplace $COM_tme 2 2 [lindex $COM_all 2]]
# set COM_ece [lreplace $COM_ece 2 2 [lindex $COM_all 2]]
# graphics 0 color blue 
# graphics 0 cone $COM_all $COM_ece radius 1
# graphics 0 cone $COM_all $COM_tme radius 1
set COM_ecd [measure center $EC_D weight mass]
set COM_tmd [measure center $TM_D weight mass]
set COM_tmd [lreplace $COM_tmd 2 2 [lindex $COM_all 2]]
set COM_ecd [lreplace $COM_ecd 2 2 [lindex $COM_all 2]]
graphics 0 color blue
graphics 0 cone $COM_all $COM_ecd radius 1
graphics 0 cone $COM_all $COM_tmd radius 1
# set COM_eca [measure center $EC_A weight mass]
# set COM_tma [measure center $TM_A weight mass]
# set COM_tma [lreplace $COM_tma 2 2 [lindex $COM_all 2]]
# set COM_eca [lreplace $COM_eca 2 2 [lindex $COM_all 2]]
# graphics 0 color blue
# graphics 0 cone $COM_all $COM_eca radius 1
# graphics 0 cone $COM_all $COM_tma radius 1
# set COM_ecb [measure center $EC_B weight mass]
# set COM_tmb [measure center $TM_B weight mass]
# set COM_tmb [lreplace $COM_tmb 2 2 [lindex $COM_all 2]]
# set COM_ecb [lreplace $COM_ecb 2 2 [lindex $COM_all 2]]
# graphics 0 color blue
# graphics 0 cone $COM_all $COM_ecb radius 1
# graphics 0 cone $COM_all $COM_tmb radius 1
# set COM_ecc [measure center $EC_C weight mass]
# set COM_tmc [measure center $TM_C weight mass]
# set COM_tmc [lreplace $COM_tmc 2 2 [lindex $COM_all 2]]
# set COM_ecc [lreplace $COM_ecc 2 2 [lindex $COM_all 2]]
# graphics 0 color blue
# graphics 0 cone $COM_all $COM_ecc radius 1
# graphics 0 cone $COM_all $COM_tmc radius 1
# set TM_A [atomselect 1 "protein and chain A and resid 211 to 339 and name CA" ]
# set TM_B [atomselect 1 "protein and chain B and resid 211 to 339 and name CA" ]
# set TM_C [atomselect 1 "protein and chain C and resid 211 to 339 and name CA" ]
set TM_D [atomselect 1 "protein and chain D and resid 211 to 339 and name CA" ]
# set TM_E [atomselect 1 "protein and chain E and resid 211 to 339 and name CA" ]
# set EC_A [atomselect 1 "protein and chain A and resid 1 to 211 and name CA" ]
# set EC_B [atomselect 1 "protein and chain B and resid 1 to 211 and name CA" ]
# set EC_C [atomselect 1 "protein and chain C and resid 1 to 211 and name CA" ]
set EC_D [atomselect 1 "protein and chain D and resid 1 to 211 and name CA" ]
# set EC_E [atomselect 1 "protein and chain E and resid 1 to 211 and name CA" ]

# set COM_ece [measure center $EC_E weight mass]
# set COM_tme [measure center $TM_E weight mass]
# set COM_tme [lreplace $COM_tme 2 2 [lindex $COM_all 2]]
# set COM_ece [lreplace $COM_ece 2 2 [lindex $COM_all 2]]
# graphics 1 color red
# graphics 1 cone $COM_all $COM_ece radius 1
# graphics 1 cone $COM_all $COM_tme radius 1

set COM_ecd [measure center $EC_D weight mass]
set COM_tmd [measure center $TM_D weight mass]
set COM_tmd [lreplace $COM_tmd 2 2 [lindex $COM_all 2]]
set COM_ecd [lreplace $COM_ecd 2 2 [lindex $COM_all 2]]
graphics 1 color red
graphics 1 cone $COM_all $COM_ecd radius 1
graphics 1 cone $COM_all $COM_tmd radius 1

# set COM_eca [measure center $EC_A weight mass]
# set COM_tma [measure center $TM_A weight mass]
# set COM_tma [lreplace $COM_tma 2 2 [lindex $COM_all 2]]
# set COM_eca [lreplace $COM_eca 2 2 [lindex $COM_all 2]]
# graphics 1 color red
# graphics 1 cone $COM_all $COM_eca radius 1
# graphics 1 cone $COM_all $COM_tma radius 1
# set COM_ecb [measure center $EC_B weight mass]
# set COM_tmb [measure center $TM_B weight mass]
# set COM_tmb [lreplace $COM_tmb 2 2 [lindex $COM_all 2]]
# set COM_ecb [lreplace $COM_ecb 2 2 [lindex $COM_all 2]]
# graphics 1 color red
# graphics 1 cone $COM_all $COM_ecb radius 1
# graphics 1 cone $COM_all $COM_tmb radius 1

# set COM_ecc [measure center $EC_C weight mass]
# set COM_tmc [measure center $TM_C weight mass]
# set COM_tmc [lreplace $COM_tmc 2 2 [lindex $COM_all 2]]
# set COM_ecc [lreplace $COM_ecc 2 2 [lindex $COM_all 2]]
# graphics 1 color red
# graphics 1 cone $COM_all $COM_ecc radius 1
# graphics 1 cone $COM_all $COM_tmc radius 1