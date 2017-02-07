#!/bin/bash
if [ $# -lt 1 ]; then
	echo "error.. need args"
	exit 1
fi

for arg in "$@"
do
	
	echo $arg
	mid=${arg%.*}
	mkdir $mid
	mv $mid.* $mid 	
	echo "$mid generated, $arg finished successfully!!!!"
done
echo "commond is $0, have fun in reconstructing"
