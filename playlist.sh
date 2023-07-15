#! /bin/bash

# Script to generate songs for specified duration by taking time as input

# Taking time as input
echo For how much duration do you need songs?
read time

# convert time into seconds
let "times=($time) * 60"

# Number of songs on a average times/5
let "Nsongs=($time)/5"
#echo "$Nsongs songs on an average"

# Initialise size of songs with zero
array=()
for ((i=0; i<$Nsongs; i++)); do
  array[$i]='0'
  # echo ${array[i]}
done

# Deciding length of songs randomly that sum upto times
for ((i=0; i<$times; i++)); do
   # generate random number and take module with Nsongs and increment value in array
   let "idx=($RANDOM)%Nsongs"
   array[$idx]=$((array[$idx]+1))
done

# create mp3 files of names and size
arraySongs=()

for ((i=0; i<$Nsongs; i++)); do
  # convert in minutes
  let "namem=(${array[$i]})/60"
  let "names=(${array[$i]})%60"
  arraySongs[$i]="${namem}_${names}.mp3"
done

echo "${arraySongs[@]}"

