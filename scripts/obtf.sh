#!/bin/bash

# Let's set variables
OBTF=("~/Documents/Zettelkasten/OBTF.md")
HELP=("~/Documents/Repos/github.com/crlvll/dotfiles/scripts/obtf-help.txt")

# help documentation
if [[ $* == "-h" ]] || [[ $1 == "--help" ]]; then
    cat ~/Documents/Repos/github.com/crlvll/dotfiles/scripts/obtf-help.txt
    
# jumps in the tee program to write a longer note
elif [[ $* == "-l" ]] || [[ $* == "--longform" ]]; then
    tee >> ~/Documents/Zettelkasten/OBTF.md

# search
elif [[ $1 == "-s" ]] || [[ $* == "--search" ]]; then
    grep -w $2 $3 $4 ~/Documents/Zettelkasten/OBTF.md

## looks at a specified date
elif [[ $1 == "-n" ]] || [[ $1 == "--on" ]]; then
    sed -n "/`date --date=$2 +"%m-%d"`/,/---/p" ~/obtf.txt

# on this date
elif [[ $1 == "-o" ]] || [[ $1 == "-on-this-day" ]]; then
    sed -n "/`date +"%m-%d"`/,/---/p" ~~/Documents/Zettelkasten/OBTF.md | grep -v $(date +%Y)

# lists all tags
elif [[ $1 == "-t" ]] || [[ $1 == "--tags" ]]; then
    grep "#" ~/Documents/Zettelkasten/OBTF.md | grep -o '#\S*' | sort -u

# inserts date
elif [[ $1 == "-d" ]] || [[ $1 == "date" ]]; then
    echo '***' >> ~/Documents/Zettelkasten/OBTF.md
    echo >> ~/Documents/Zettelkasten/OBTF.md
    echo '#' `date +%F` >> ~/Documents/Zettelkasten/OBTF.md

# agenda

elif [[ $1 == "-a" ]] || [[ $1 == "--agenda" ]]; then
    grep '@agenda\|@inbox' ~/Documents/Zettelkasten/OBTF.md

# remove

elif [[ $1 == "-r" ]] || [[ $1 == "--remove" ]]; then
    sed -i '/'$2'/d' ~/Documents/Zettelkasten/OBTF.md

# regular note

else
    echo '-' `date +%R` $* >> ~/Documents/Zettelkasten/OBTF.md
fi

