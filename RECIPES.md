pussh recipes
=============

Here you will find useful **pussh** snippets.

Mass copy a file tree (broadcast) :

    tar czf files.tar.gz ... && pussh -f servers -i files.tar.gz tar -xzC /to/dest

Mass copy several remote file trees (gather) :

    pussh -f servers -o '|(mkdir -p %h && tar -xzC %h)' tar -czC /src/path .

Print distinct running kernels with their frequency (histogram) :

    pussh -f servers 'uname -a' |sort |uniq -c |sort -rn

Find largest files and folders across several hosts (display in MB), where
'ionice -c3' is optional but recommended :

    pussh -f servers ionice -c3 du -Smax / |sort -rn


Debian specific
---------------

Show version of installed packages, properly aligned :

    pussh -f servers COLUMNS=120 dpkg -l openssh-server |grep ': ii' 2>/dev/null
    pussh -f servers sh -c 'COLUMNS=120 dpkg -l openssh-server |grep ^i 2>/dev/null'

Or more specific while searching for specific dpkg information :

    pussh -f servers dpkg-query -W -f '${Version}' openssh-server 2>/dev/null

Show pending APT updates count, optionally sorted :

    pussh -f servers -l root sh -c 'apt-get -qq update && apt-get -qsy dist-upgrade |grep -c ^Inst 2>/dev/null' | sort -rn -t: -k2

