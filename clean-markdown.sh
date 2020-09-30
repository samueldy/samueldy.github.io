#!/bin/bash

# Short script to clean Pandoc-generated Markdown for use with Hugo GoldMark

FILENAME="$1"

sed -i \
    -e 's|~\([^~]*\)~|<sub>\1</sub>|g' \
    -e 's|\^\([^\^]*\)\^|<sup>\1</sup>|g' \
    -e '/\*\*References/,$s|\(\.\)?\\\[\([^\\]*\)\\\]|\n\n[^\1]:|g' \
    -e 's|\\\[\([^\\]*\)\\\]|[^\1]|g' \
    -e 's|^\[\^\([^]]+\)\]|[^\1]:|g' \
    "$FILENAME"