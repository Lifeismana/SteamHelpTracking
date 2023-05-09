#!/bin/bash

cd "$(dirname "$0")"

php crawl.php

git add -A
git commit -a -m "$(git status --porcelain | wc -l) files | $(git status --porcelain|awk '{print "basename " $2}'| sh | sed '{:q;N;s/\n/, /g;t q}')" || exit 0
git push
