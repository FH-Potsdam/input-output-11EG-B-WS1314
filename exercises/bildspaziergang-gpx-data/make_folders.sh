#!/bin/bash
# This script needs imagemagick
# brew install imagemagick
#
users=("davidroettger" "thrill2212" "wookeeeee" "martinlexow" "ronleisner" "tilokrueger" "dueuel" "pfingstday" "nushin" "jonij" "tomie89" "jensra" "lightwaveez" "sacred45" "dasrehman" "ebird-design" )
# this should loop all users
#
#
for i in "${users[@]}"
do
   :
   # do whatever on $i
   rm -rf $i
    mkdir $i
    touch $i/.gitkeep
    # echo "![image](screenshot.png)  " >> $i/README.md
    # echo "#TITLE  " >> $i/README.md
    # echo "##DESCRIPTION  " >> $i/README.md
    # echo "##[AUTHOR](https://github.com/$i)  " >> $i/README.md
    # echo "Hello my name is [$i](https://github.com/$i) and I'd like to say... " >> $i/README.md
    # convert -size 1280x720 xc:white $i/screenshot.png
    # echo "##LICENSE  " >> $i/README.md

done