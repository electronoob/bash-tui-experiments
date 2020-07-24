#!/bin/bash

IFS=$'\n'
#wrap in ( ) parans to convert to array, need to use IFS to split on newline char
var=($(lsmod))
unset IFS
#double quotes preserve newlines ind tabs etc nstead of converting to spaces
for i in "${var[@]}"
do
  echo "${i}"
done
# a diff of lsmod against this script's output confirm they are identical

