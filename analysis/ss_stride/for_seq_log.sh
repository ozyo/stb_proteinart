inp=$1
resnr=$2

rm $inp\_for_seqLogo.dat
touch $inp\_for_seqLogo.dat
cut -c 1-$[resnr*2] $inp.dat >> $inp\_for_seqLogo.dat
cut -c $[resnr*2+1]\-$[resnr*4] $inp.dat >> $dfile\_for_seqLogo.dat
cut -c $[resnr*4+1]\-$[resnr*6] $inp.dat >>$dfile\_for_seqLogo.dat
cut -c $[resnr*6+1]\-$[resnr*8] $inp.dat >> $dfile\_for_seqLogo.dat
cut -c $[resnr*8+1]\-$[resnr*10] $inp.dat >> $dfile\_for_seqLogo.dat
sed -i '' '/^[A-Z]/i \
> \
' $inp\_for_seqLogo.dat
weblogo/seqlogo -f $inp\_for_seqLogo.dat -c -e -a -p -F PDF -h 5 -w $resnr > $inp\_for_seqLogo.pdf