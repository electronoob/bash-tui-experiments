#!/bin/bash
curl -s --url "imaps://imap.fastmail.com/INBOX/"\
       	--user "electronoob@fastmail.com:`cat password`"\
       	--request "fetch 1:* (UID)"

