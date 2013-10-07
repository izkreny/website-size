## Why?

Because I want to estimate size of the website before I download it entirely with [GNU Wget](http://www.gnu.org/software/wget/ "Gnu Wget homepage").

## What?

This bash shell wrapper script will take **URL of the website as input** and use Wget *Web spider super powers* to recursively crawl website and save all info into the log file from which size will be estimated with a little help from our friends, i.e., grep, sed and awk.

## How?

Usage: `website-size URL`

Depending on the size of the website crawling process can take some time to finish. Patience is a virtue.

Festina lente. ;)
