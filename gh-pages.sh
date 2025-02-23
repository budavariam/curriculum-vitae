#!/usr/bin/env bash

FILE="budavariam.pdf"
BRANCH="gh-pages"

docker compose up || exit 1

git branch -D "$BRANCH"
git push -d origin "$BRANCH"
git checkout --orphan "$BRANCH" || exit 2
rm -rf ./.gitignore ./.vscode
shopt -s extglob
rm -rf !(budavariam.pdf) 2> /dev/null
git reset
git add "./$FILE"
git checkout main -- index.html
git add index.html
git commit -m "CV"
git push origin "$BRANCH" --force
git checkout main
git reset --hard HEAD