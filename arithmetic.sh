#!/bin/bash

# add
echo $(( 5 + 3 ))
#*
echo $(( 10 * 3 ))
#/ and %
echo $(( 10 / 3 ))    # 3
echo $(( 10 % 3 ))    # 1
#x+y
x=5
y=3
echo $(( x + y ))    # 8
#Ternary
echo $(( 5 > 3 ? 10 : 20 ))    # 10
#[*]
echo $[365 * 24]  # 8760

