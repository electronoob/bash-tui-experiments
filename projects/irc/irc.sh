#!/bin/bash

IRC_CHANNEL="#irc"
IRC_SERVER="213.229.110.146"
IRC_NICK="bashirc"
IRC_PORT="6667"

main() {
  redraw
  connect
  loop
}

#globals
CMD_BUFFER=""

function connect {
  exec 3<>/dev/tcp/${IRC_SERVER}/${IRC_PORT}
  echo "USER a b c d e" >&3
  echo "NICK ${IRC_NICK}" >&3
}

function irc {
  case "$1" in
    'PING') 
      #echo "PONG? PONG!"
      echo "PONG $2" >&3
      ;;
    *) 
      #echo "$*"
      ;;
  esac  
  #check for raw 001 connected
  case "$2" in
    '001')
      echo "001 received"
      echo "JOIN :${IRC_CHANNEL}" >&3
      ;;
    'PRIVMSG')
      echo $*
      ;;    
    *)
      :
      ;;
  esac
}

function io {
  #get data from socket
  while read -r -t 0.1 data
  do
    irc $data
  done <&3
  #get data from stdin
  while IFS= read -rn 1 -t 0.1 user
  do
    CMD_BUFFER+=$user
    [ -z "$user" ] && enter
  done
}
function enter {
  case "${CMD_BUFFER::1}" in
    '/')
        echo "${CMD_BUFFER:1}" >&3
        ;;
    *)
        echo "PRIVMSG $IRC_CHANNEL :${CMD_BUFFER}">&3
	;;
  esac
  CMD_BUFFER=""
}
function redraw {
  :
  #hide cursor
  echo -e "\e[?25l"
  #home cursor
  echo -e "\e[H"
  #display prompt and erase remining characters on line
  echo -e "$(k 245 234) ${IRC_NICK} $(k 234 248)${segment} ${IRC_SERVER} ${section} ${IRC_CHANNEL} $(k 248 0)${segment} $(end)\e[K ${CMD_BUFFER}"
}
function loop {
  io
  redraw
  loop
}
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


main "$@"; exit


