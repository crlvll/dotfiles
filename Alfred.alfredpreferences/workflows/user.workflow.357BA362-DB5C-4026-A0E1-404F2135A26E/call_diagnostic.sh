#!/bin/zsh

./diagnostic.sh > diagnostic.html

#qlmanage -p "diagnostic.html"
open "diagnostic.html"
