#!/usr/bin/env bash
# set -x
audio=true
subs=true
inverted=false
# Assumes audio is tracks 1&2 and video 3&4
while test $# -gt 0; do
    case "$1" in
        -a|--audio)
            subs=false
            shift
            ;;
        -s|--subtitles)
            audio=false
            shift
            ;;
        -i|--inverted)
            inverted=true
            shift
            ;;
        *)
            break
            ;;
    esac
done
for f in "$@";
do
    if [ "$inverted" = false ] ; then
        if [ "$audio" = true ] ; then
            mkvpropedit -q "$f"  --edit track:a1 --set flag-default=0  --edit track:a2 --set flag-default=1
            echo "Set secondary audio for $f"
        fi
        if [ "$subs" = true ] ; then
            mkvpropedit -q "$f"  --edit track:s1 --set flag-default=0  --edit track:s2 --set flag-default=1
            echo "Set secondary subs for $f"
        fi
    else
        if [ "$audio" = true ] ; then
            mkvpropedit -q "$f"  --edit track:a1 --set flag-default=1  --edit track:a2 --set flag-default=0
            echo "Set primary audio for $f"
        fi
        if [ "$subs" = true ] ; then
            mkvpropedit -q "$f"  --edit track:s1 --set flag-default=1  --edit track:s2 --set flag-default=0
            echo "Set primary subs for $f"
        fi
    fi
done