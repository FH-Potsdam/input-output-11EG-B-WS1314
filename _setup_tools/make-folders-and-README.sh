#!/bin/bash
# This script needs imagemagick
# brew install imagemagick
#
## This script creates folders from the list and adds every item
# to a readme
# it should read in all the team members and create for each
# name in the team a folder with his github username
#
#
users=("dasrehman" "davidroettger" "dueuel" "ebird-design" "jensra" "jonij" "lightwaveez" "martinlexow" "nushin" "pfingstday" "ronleisner" "sacred45" "thrill2212" "tilokrueger" "tomie89" "wookeeeee")
# this should loop all users
#
#
for i in "${users[@]}"
do
   :
   # do whatever on $i
    mkdir $i
    touch $i/README.md
    touch $i/IOApparat_$i.ino
    echo "![fritzing-layout](fritzing-layout.png)  " >> $i/README.md
    echo "![image](screenshot.png)  " >> $i/README.md
    echo "#TITLE  " >> $i/README.md
    echo "##DESCRIPTION  " >> $i/README.md
    echo "##AUTHOR  " >> $i/README.md
    echo "Hello my name is [$i](https://github.com/$i) and I'd like to say... " >> $i/README.md
    convert -size 1280x720 xc:white $i/screenshot.png
    convert -size 1280x720 xc:white $i/fritzing-layout.png
    echo "##LICENSE  " >> $i/README.md

done


for f in "${users[@]}"
do
   :
    echo "[$f](https://github.com/$f)  " >> README.md
    echo "![$f/image]($f/screenshot.png)  " >> README.md
    echo "![$f/image]($f/fritzing-layout.png)  " >> README.md

done