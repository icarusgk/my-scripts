#!/bin/bash

echo 'Pushing to a new Github repository...'
echo 'Currently in: '
pwd

# If file doesn't exist
if [[ ! -f README.md ]]
then
    echo "# $1" >> README.md
fi

git init

# Add all or especified files
if [[ $2 -eq 'a' ]]
then
    git add *
else
    for item in "$@";
    do
        git add item
    done
fi

# Commit
git commit -m "first commit"

# Change branch
git branch -M main

# Add the remote repository
git remote add origin https://github.com/icarusgk/"$1".git

# Push to the remote repository
git push -u origin main
