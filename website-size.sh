#!/bin/bash
# Info: https://github.com/mariomaric/website-size#readme

# Prepare wget logfile
log="/tmp/wget-website-size-log"

# Do the spider magic
echo "### Crawling ${!#} website... ###"
sleep 2s
echo "### This will take some time to finish, please wait. ###"

wget \
    --recursive --level=inf \
    --spider --server-response \
    --no-directories \
    --output-file="$log" "$@"

echo "Finished with crawling!"
sleep 1s

# Check if prepared logfile is used
if [ -f "$log" ]
then
    # Calculate and print estimated website size
    echo "Estimated size: $(\
        grep -e "Content-Length" "$log" | \
        awk '{sum+=$2} END {printf("%.0f", sum / 1024 / 1024)}'\
    ) Mb"

    # Delete wget log file
    rm "$log"
else
    echo "Unable to calculate estimated size."
    exit 1
fi

exit 0
