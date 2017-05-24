#!/bin/sh

if [ "$#" -lt "2" ]; then
  echo "Usage:\n\t./benchmark.sh tag iterator\n\nExample:\n\t./benchmark.sh \"kNN kernel\" \"seq 1 10\"\n";
  exit
fi

# Very convenient function to plot the results of this script
# function plot { gnuplot -e "plot '$1' using 1:2; pause -1" ; }

tag=$1
vals=$(eval "$2")
echo $vals

for n in $vals ; do
  dur=$(./perftest $n | grep -i "$tag" | cut -f2 -d: | awk '{print $1}') ;
  echo "$n\t$dur" >> gpu_perftimes.txt ;
done

