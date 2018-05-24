#! /bin/bash

# This script will allow the use of rsync and accommodate for the problem with using the
# windows drive in the path with a ":", i.e. "c:/somepath" which rsync
# interprets as a hostname/ip.  Use /<drive>/ instead, i.e. "/c/somepath" with this script.

PROG=$(basename $0)
# set MINGW_RSYNC in environment to override
[ -z "$MINGW_RSYNC" ] && MINGW_RSYNC=/c/MinGW/msys/1.0/bin/rsync.exe

# There is an issue with pathnames with escaped backspaces which is not
# handeled with just "$*", but is with an array
largs=( )
while [ "$1" ]; do
    largs+=( "$1" )
    shift
done

# This handles the drive issue
export MSYS2_ARG_CONV_EXCL="*"
echo "RUNNING: $MINGW_RSYNC ${largs[@]}"
$MINGW_RSYNC "${largs[@]}"

[ "$?" -eq 0 ] && exit 0
echo '--- NOTE! ---'
echo 'You received an error. If you used the drive in the path, with a ":" (i.e. "c:/somepath"), '
echo 'try using "/<drive>/" instead (i.e. "/c/somepath")'

