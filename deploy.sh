#!/bin/bash

# Define directories
HUGO_DIR="/home/jacquesvb/Dropbox/Website/jacques-blog/"
PUBLIC_DIR="${HUGO_DIR}public/"
GITHUB_DIR="/home/jacquesvb/Dropbox/Website/jacquesvb.github.io/"

# Navigate to the Hugo directory
cd "$HUGO_DIR"

# Build the Hugo site
hugo

# Sync the public folder with the GitHub pages folder
rsync -av --delete --exclude '.git' "$PUBLIC_DIR" "$GITHUB_DIR"

# Navigate to the GitHub pages folder
cd "$GITHUB_DIR"

# Add changes to git
git add .
# Commit changes with a time/date stamp
COMMIT_MSG="blog-update-$(date +"%Y-%m-%d %H:%M:%S")"
git commit -am "$COMMIT_MSG"
# Push changes to the remote repository
git push
