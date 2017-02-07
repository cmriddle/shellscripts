#!/bin/bash
if [ $# -lt 1 ]; then
	echo "error.. need args"
	exit 1
fi

for arg in "$@"
do
	
	echo $arg
	mid=${arg%.*} 	
	mid=${mid}"_flip.rec"
	trimvol -yz $arg $mid
#flip the tomogram

	midd=${mid%.*} 	 
	midd=${midd}"int.rec"
	midsize=$(header -size $mid)  #size of x y z
	midsection=${midsize##*\ }    #size of z
	trimvol -sz $(($midsection/2-25)),$(($midsection/2+25)) $mid $midd  # adjust the contrast of final tomo using mid frames

	rm $mid
	echo "$midd generated, $arg finished successfully!!!!"
	echo "midsection is $midsection, contrast range is $(($midsection/2-25)),$(($midsection/2+25))"
done
echo "commond is $0"
echo "args are: $arg"


