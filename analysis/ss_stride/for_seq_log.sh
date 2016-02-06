dfile=SS_GLU_IVM_WT_DOPC
rm $dfile\_for_seqLogo.dat
touch $dfile\_for_seqLogo.dat
cut -c 1-678 $dfile.dat >> $dfile\_for_seqLogo.dat
cut -c 679-1356 $dfile.dat >> $dfile\_for_seqLogo.dat
cut -c 1357-2034 $dfile.dat >>$dfile\_for_seqLogo.dat
cut -c 2035-2712 $dfile.dat >> $dfile\_for_seqLogo.dat
cut -c 2713-3390 $dfile.dat >> $dfile\_for_seqLogo.dat
sed -i '' '/^[A-Z]/i \
> \
' $dfile\_for_seqLogo.dat
weblogo/seqlogo -f $dfile\_for_seqLogo.dat -c -e -a -p -F PDF -h 5 -w 339 > $dfile\_for_seqLogo.pdf

