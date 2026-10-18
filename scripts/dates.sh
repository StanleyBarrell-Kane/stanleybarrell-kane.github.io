#!/bin/sh
# Written by Quarto before each render; do not edit _variables.yml by hand.
# Writes to a temp file first and only replaces _variables.yml if the
# content actually changed, so quarto preview's file watcher doesn't see a
# spurious touch on every render and restart the dev server.
tmp="$(mktemp)"
{
  echo "updated: \"$(date '+%B %Y')\""
  echo "cv_updated: \"$(stat -f '%Sm' -t '%B %Y' cv/cv.pdf)\""
} > "$tmp"

if [ -f _variables.yml ] && cmp -s "$tmp" _variables.yml; then
  rm "$tmp"
else
  mv "$tmp" _variables.yml
fi
