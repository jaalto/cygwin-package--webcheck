#!/bin/sh
#
# install-after.sh -- Custom installation
#
# The script will receive one argument: relative path to
# installation root directory. Script is called like:
#
#    $ install-after.sh .inst
#
# This script is run after [install] command.

Cmd()
{
    echo "$@"
    [ "$test" ] && return
    "$@"
}

Main()
{
    root=${1:-".inst"}

    if [ "$root"  ] && [ -d $root ]; then

        root=$(echo $root | sed 's,/$,,')  # Delete trailing slash

	# install (possibly) missing files
	install -m 644 -d $root/usr/share/webcheck/parsers/html
	install -m 644 parsers/html/* $root/usr/share/webcheck/parsers/html
    fi
}

Main "$@"

# End of file
