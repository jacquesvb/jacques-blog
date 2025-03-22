---
title: Scripting Blog Deployment
date: 2025-02-18
draft: false
tags:
  - blog
  - hugo
  - webdev
lastmod: 2025-02-19T07:27:16.352Z
---
## Intro

In my last post I went over creating a blogging workflow that utilized Obsidian, Hugo, and GitHub. The Obsidian plugin streamlined the migration of data from Obsidian to Hugo, but the building and deployment of the Hugo site involved a little jiggery-pokery.

Wouldn't it be nice if we could automate the process? Here's where bash scripting comes to the rescue. I'll post an example of my script here and then I'll go over what it does.

```bash
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
```

The comments in the code should make things obvious. The only challenge I had when writing this script was that "rsync" was wiping out the ".git" folder in "jacquesvb.github.io".  Fortunately there is an "--exclude" flag that allowed me to preserve that folder.
