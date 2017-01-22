#!/usr/bin/env bash
set -x
subliminal download -l en "$@"
for i in "$@";
do
    if [ $? -eq 0 ]; then
        filebot -rename -non-strict "$i" ${i%.*}.en.srt
    else
        filebot -rename -non-strict "$i"
    fi
done
