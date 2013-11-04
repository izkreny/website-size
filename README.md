## WHY?

Because I want to estimate size of the website before I download it entirely with [GNU Wget] [1].

## WHAT?

`website-size.sh` bash shell wrapper script will take **URL of the website as input** and use Wget *Web spider super powers* to recursively crawl website and save all info into the logfile from which size will be estimated with a little help from our friends, i.e., grep and awk.

`estimate-size.sh` will do the same thing, but it will take existing **Wget logfile as input**. Additionally you can provide **second argument** in form of [Internet media type] [2] to filter calculation only to specified file format.

## HOW?

### USAGE

#### website-size

    $ website-size [OPTIONS] URL

##### DEFAULT OPTIONS AND HOW TO OVERRIDE SOME OF THEM

`website-size.sh` is using following Wget options:

- `--recursive`, `-r` — Turn on recursive retrieving.
- `--level=inf`, `-l 0` — Specify recursion maximum depth level, i.e., sets infinite recursion depth.

    **You can override this option while invoking the script, e.g.:**

        $ website-size -l 1 http://example.com/image-gallery.html

    This is useful if you want to estimate size of all elements (e.g., images) presented solely in `image-gallery.html` webpage.

- `--spider` — Convert Wget to Web spider, i.e., do not download the pages, just check that they are there.
- `--server-response`, `-S` — Print the headers sent by HTTP server.
- `--no-directories`, `-nd` — Don't create a hierarchy of directories when retrieving recursively. Wget will otherwise create an empty hierarchy of directories that we really do not need for our use case.
- `--output-file=logfile`, `-o logfile` — Log all messages to *logfile*. In our case *logfile* is equal to `/tmp/wget-website-size-log` which allows to calculate estimated size of the website.

    **You can override this option while invoking the script, e.g.:**

        $ website-size -o log http://example.com

    In the example above Wget will log all messages into the `log` file and therefore `website-size.sh` script will at the end print out "**Unable to calculate estimated size.**" message. In this case you can use `estimate-size.sh` script to estimate size of the website or specific type of files.

##### EXTRA OPTIONS AND EVEN MORE

Other useful Wget options that you can use while invoking script:
- `--no-check-certificate` — Don't check the server certificate against the available certificate authorities. Also don't require the URL host name to match the common name presented by the certificate. Use this if you have issues with HTTPS URLs. 
- `--no-parent`, `-np` — Do not ever ascend to the parent directory when retrieving recursively. This is a useful option, since it guarantees that only the files *below* a certain hierarchy will be downloaded.
- `--wait=seconds`, `-w seconds` — Wait the specified number of *seconds* between the retrievals. Use of this option is recommended, as it lightens the server load by making the requests less frequent. 
- `--user-agent=agent-string`, `-U agent-string` — Identify as *agent-string* (i.e. `User-Agent` header field) to the HTTP server.

For more information about Wget options see [GNU Wget manual] [3].

Depending on the size of the website crawling process can take some time to finish. Patience is a virtue.

Festina lente. ;)

#### estimate-size

    $ estimate-size logfile [TYPE]

Usage is pretty straightforward, get yourself some Wget logfile and start messing around with it. You can find [list of common media types] [4] @ Wikipedia.

### REQUIREMENTS

**Wget**, **grep** and **awk** are integral part of Debian (based) GNU/Linux distribution(s).

### INSTALLATION

Example commands listed below are based on Ubuntu 12.04 LTS.

1. Install requirements
2. Download and uncompress website-size, e.g.:

        $ sudo wget -q https://github.com/mariomaric/website-size/archive/master.tar.gz -O - | tar -C /opt -xz

3. Create a symbolic link to the scripts you want to use in a directory that is already in your PATH, e.g.:

        $ sudo ln -s /opt/website-size-master/website-size.sh /usr/local/bin/website-size
        $ sudo ln -s /opt/website-size-master/estimate-size.sh /usr/local/bin/estimate-size

[1]: https://github.com/mariomaric/download-website#readme
    "Download website - Wget wrapper script"
[2]: http://en.wikipedia.org/wiki/Internet_media_type
    "Internet media type @ Wikipedia"
[3]: http://www.gnu.org/software/wget/manual/wget.html
    "GNU Wget Manual"
[4]: http://en.wikipedia.org/wiki/Internet_media_type#List_of_common_media_types
    "List of common media types @ Wikipedia"
