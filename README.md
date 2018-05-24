# mingw-tools
Utilities to assist in using [MinGW](http://www.mingw.org/)

## Scripts
### rsync.sh
Allows the use of MinGW rsync and accomodates issues with escaping spaces and drive designation (use /c/somepath instead for c:/somepath)

    bashprompt > ./rsync.sh  -av /c/Users/wadet2/Desktop/ScaleioNotes /c/Users/wadet2/Syncplicity\ Folders/MyScaleIO/

or

    bashprompt > ./rsync.sh -av ~/Desktop/ScaleioNotes ~/Syncplicity\ Folders/MyScaleIO/
