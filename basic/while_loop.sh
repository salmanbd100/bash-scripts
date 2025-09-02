#!/bin/bash
# This script prints the numbers from 1 to 10 using a while loop.

i=1

while [[ $i -le 10 ]]; do
 echo "$i"
 (( i += 1 ))
done