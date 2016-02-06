sed 's/ //g' ../SS_GLU_IVM_WT_DOPC.dat > 3RIF_GLU_IVM_md1_nospace.dat
cut -c 1-339 *_nospace.dat > chA.dat
cut -c 340-678 *_nospace.dat > chB.dat
cut -c 679-1017 *_nospace.dat > chC.dat
cut -c 1018-1356 *_nospace.dat > chD.dat
cut -c 1357-1695 *_nospace.dat > chE.dat