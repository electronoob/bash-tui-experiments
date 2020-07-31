#!/bin/bash
login=$(cat password)
listmail=$(curl -s --url "imaps://imap.fastmail.com/INBOX/"\
	      --user "$login"\
	      --request "SEARCH TEXT \"GPS Logger -\" FROM MORRIS")
	      
mapfile -t test_array < <(curl -s --url "imaps://imap.fastmail.com/INBOX" --user "$login" --request "SEARCH TEXT \"GPS Logger -\" FROM MORRIS")
	      

echo ${test_array}
echo $listmail
