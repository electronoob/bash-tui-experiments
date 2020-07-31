#!/bin/bash
login=$(cat password)
tmp="shittytempdir"
cwd=$(pwd)
listmail=$(curl -s --url "imaps://imap.fastmail.com/INBOX/"\
	      --user "$login"\
	      --request "SEARCH TEXT \"GPS Logger -\" FROM MORRIS")

echo "$listmail"
