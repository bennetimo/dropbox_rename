#!/bin/bash
ls -1a *[.jpg,.mp4] | 
sed -E 's/(.*)/mv -f "\1"@\1/' | 
sed -E 's/(.*)@([0-9]{4})-([0-9]{2})-([0-9]{2}) ([0-9]{2}).([0-9]{2}).([0-9]{2})(.*)/\1@\2\3\4_\5\6\7\8/' | 
sed -E 's/(.*)@(.*)(.jpg)/\1 IMG_\2\3/' |
sed -E 's/(.*)@(.*)(.mp4)/\1 VID_\2\3/' |
sort |
sh

#1. List (only the file names) of all jpg and mp4 files
#2. Change to mv-f filename@filename
#3. Change everything after the @ to be the way the nexus handles the timestamps
#4. Add an IMG_ prefix to every jpg, and remove @ character
#5. Add an VID_ prefix to every mp4, and remove @ character
#6. Sort and pipe to shell