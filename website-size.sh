#!/bin/bash
# Requirements: wget, grep, sed, awk
# Usage: website-size URL

# wget log file
log=/tmp/wget-website-size-log.txt

# Do the spider work
echo "### Checking size of $1 website... ###"
sleep 2s
echo "### This will take some time to finish, please wait. ###"
wget --recursive --spider --server-response --output-file="$log" "$1"
echo "Finished!"
sleep 1s

# Calculate and print website size
echo "Estimated size of the website: $(\
  grep -e "Content-Length" "$log" | \
  sed -e 's/  Content-Length: //g' | \
  awk '{sum+=$1} END {printf("%.0f", sum / 1024 / 1024)}'\
) Mb"

# Delete wget log file
rm "$log"

exit
