#!/usr/bin/env bash

out=$(~/bin/audiodevice output)
if [ "$out" == "Headphones" ]; then
    ~/bin/audiodevice output "DELL U2515H"
fi

if [ "$out" == "DELL U2515H" ]; then
    ~/bin/audiodevice output "Internal Speakers"
fi

if [ "$out" == "Internal Speakers" ]; then
    ~/bin/audiodevice output "DELL U2515H"
fi

if [ "$out" == "DELL U2515H" ]; then
    ~/bin/audiodevice output "Headphones"
fi