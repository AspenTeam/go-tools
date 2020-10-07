#!/bin/bash
git remote add upstream https://github.com/dominikh/go-tools
git fetch upstream
git checkout master
git reset --hard upstream/release.2020.1
git checkout origin/updateScript -- updateFromUpstream.sh
find . -name '*.go' -type f -exec sed -i '' -e 's/honnef.co\/go\/tools/github\.com\/AspenTeam\/go-tools/g' {} \;q
find . -name 'go.mod' -type f -exec sed -i '' -e 's/honnef.co\/go\/tools/github\.com\/AspenTeam\/go-tools/g' {} \;q
git commit -a -m "Update from upstream re-ref to github"