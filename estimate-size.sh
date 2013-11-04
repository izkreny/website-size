#!/bin/bash
# Info: https://github.com/mariomaric/website-size#readme

# Check if second argument is provided
if [ -z "$2" ]
then
    # Calculate and print estimated website size
    echo "Estimated size: $(\
        grep -e "Content-Length" "$1" | \
        awk '{sum+=$2} END {printf("%.2f", sum / 1024 / 1024)}'\
    ) Mb"
else
    # Calculate and print estimated size of files
    echo "Estimated size of $2 files: $(\
        grep -e "Length" "$1" | grep -e "$2" | grep -v "unspecified" | \
        awk '{sum+=$2} END {printf("%.2f", sum / 1024 / 1024)}'\
    ) Mb"
fi

exit 0
