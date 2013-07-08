pussh recipes
=============

Here you will find useful **pussh** snippets.

Mass copy a file tree (broadcast) :

    tar czf files.tar.gz ... && pussh -f servers -i files.tar.gz tar -xzC /to/dest

Mass copy several remote file trees (gather) :

    pussh -f servers -o '|(mkdir -p %h && tar -xzC %h)' tar -czC /src/path .
