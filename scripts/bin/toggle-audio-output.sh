#!/usr/bin/env bash

screen=$(~/bin/audiodevice output list | grep "DELL")

out=$(~/bin/audiodevice output)
if [ "$out" == "Headphones" ]; then
    ~/bin/audiodevice output "$screen"
fi

if [ "$out" == "Internal Speakers" ]; then
    
    ~/bin/audiodevice output "$screen"
fi

if [ "$out" == "$screen" ]; then
    ~/bin/audiodevice output "Internal Speakers"
    ~/bin/audiodevice output "Headphones"
fi