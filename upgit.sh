#!/bin/bash

set -e 

GIT_REPO=$1
GIT_BRANCH=$2
GIT_ACTION=$3


# Description of Git Update 

echo "Current git folder name: "
basename $(git config remote.origin.url |sed "s/\.git$//")
echo "Current git repo url: "
git remote -v | head -n1 | awk '{print $2}'

# Format
echo "Please use the format mentioned below to update"
echo "./upgit.sh [Repo Name / Project Name] [Branch] [Action]"


# Check for arguments
if [[ $# -lt 3 ]] ; then
        echo '[ERROR] You must supply a description of action done and repo branch name'
        exit 1
fi

git add -A
git commit -m "$GIT_REPO | Action: $GIT_ACTION | Branch: $GIT_BRANCH"
git push origin $GIT_BRANCH
