#!/bin/bash
# Requirements: wget, grep, sed, awk
# Usage: website-size URL

# One-lineristic wget, grep, sed & awk magic
echo "Estimated size of the $1 website: $(\
  wget -r --spider -S -O - "$1" | \
  grep -e "Content-Length" | \
  sed -e 's/  Content-Length: //g' | \
  awk '{sum+=$1} END {printf("%.0f", sum / 1024 / 1024)}'\
) Mb"

exit
