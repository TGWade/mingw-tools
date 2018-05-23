#! /bin/bash

# This script will allow the use of rsync and accommodate for the problem with using the
# windows drive in the path, i.e. "c:/somepath" which rsync
# interprets as a hostname/ip.  Use /<drive>/ instead, i.e. "/c/somepath" with this script.
PROG=$(basename $0)

# There is an issue with pathnames with escaped backspaces which is not
# handeled with just "$*", but is with an array
largs=( )
while [ "$1" ]; do
    largs+=( "$1" )
    shift
done
#echo ${PROG}: myargs ${largs[@]}

# This handles the drive issue
export MSYS2_ARG_CONV_EXCL="*"
cmd=/c/MinGW/msys/1.0/bin/rsync.exe
echo "RUNNING: $cmd ${largs[@]}"
#/c/MinGW/msys/1.0/bin/rsync.exe "${largs[@]}"
$cmd "${largs[@]}"

[ "$?" -eq 0 ] && exit 0
echo '--- NOTE! ---'
echo 'You received an error. If you used the drive in the path (i.e. "c:/somepath"), '
echo 'try using "/<drive>/" instead (i.e. "/c/somepath")'

