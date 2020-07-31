#!/bin/bash
curl -s --url "imaps://imap.fastmail.com/INBOX/"\
       	--user "`cat password`"\
       	--request "fetch 1:* (UID)"

