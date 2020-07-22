#!/bin/bash

segment=""
section=""
# set foreground to the 'default'
function df() {
  echo "\e[39m"
}
# set background to the 'default'
function db() {
  echo "\e[49m"
}
function fg() {
  echo "\e[38;5;${1}m"
}
function bg() {
  echo "\e[48;5;${1}m"
}
function end(){
  echo "\e[0m"
}
function b() {
  echo "\e[1m"
}
function k() {
  echo $(fg $1)$(bg $2)
}

echo -e "$(k 245 234) electronoob $(k 234 248)${segment} irc.efnet.org ${section} #randomchan $(k 248 0)${segment} $(end)umm lets pretend this is a channel topic"
