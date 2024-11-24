#!/bin/bash

clear

echo "the script start now"
echo "hi, $USER"
echo

echo "I will now fetch you a list of connected users:"
echo
w
echo
echo "I'm setting two voriables now:"
COLOUR="Balck"
VALUE="9"
echo "this is string : $COLOUR"
echo "this is a number : $VALUE"
echo 

echo "Finished"

set -x
w
set +x

set -v
echo "Salom, dunyo"
