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
    echo "[$i](https://github.com/$i)  " >> README.md
    echo "![$i/image]($i/screenshot.png)  " >> README.md
done