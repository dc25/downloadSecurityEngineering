#! /bin/bash

##
## Got "command -v" technique from answer to this question:
##    https://stackoverflow.com/questions/592620/how-can-i-check-if-a-program-exists-from-a-bash-script
##

DEPENDSON='pdftk curl'
for s in $DEPENDSON; do
    command -v $s >/dev/null 2>&1 || { echo >&2 "I require $s but it is not installed.  Aborting."; exit 1; }
done

FOLDER=https://www.cl.cam.ac.uk/~rja14/Papers/

CHAPTERS='
SEv3-pref-May16.pdf 
SEv3-ch1-7sep.pdf 
SEv3-ch2-7sep.pdf 
SEv3-ch3-7sep.pdf 
SEv3-ch4-7sep.pdf 
SEv3-ch5-7sep.pdf 
SEv3-ch6-7sep.pdf 
SEv3-ch7-7sep.pdf 
SEv3-ch8-7sep.pdf 
SEv3-ch9-7sep.pdf 
SEv3-ch10-7sep.pdf 
SEv3-ch11-7sep.pdf 
SEv3-ch12-7sep.pdf 
SEv3-ch13-7sep.pdf 
SEv3-ch14-7sep.pdf 
SEv3-ch15-7sep.pdf 
SEv3-ch16-7sep.pdf 
SEv3-ch17-7sep.pdf 
SEv3-ch18-7sep.pdf 
SEv3-ch19-7sep.pdf 
SEv3-ch20-7sep.pdf 
SEv3-ch21-7sep.pdf 
SEv3-ch22-7sep.pdf 
SEv3-ch23-7sep.pdf 
SEv3-ch24-7sep.pdf 
SEv3-ch25-7sep.pdf 
SEv3-ch26-7sep.pdf 
SEv3-ch27-7sep.pdf 
SEv3-ch28-7sep.pdf 
SEv3-ch29-7sep.pdf 
SEv3-bib-7sep.pdf 
'

for s in $CHAPTERS; do
    curl ${FOLDER}$s -o $s
done

pdftk $CHAPTERS output SecurityEngineering—ThirdEdition.pdf 
rm $CHAPTERS
