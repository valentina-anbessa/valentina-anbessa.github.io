#!/bin/sh

cd /Users/decken/Downloads/valentina-anbessa.github.io
/usr/local/bin/docker exec -i youtube-app-1 python app/refresh_static_site.py > docker.log 2>&1
mv /Users/decken/Dropbox/Youtube/index.html .
git add .
git commit -m "refresh index.html at `date +"%Y-%m-%dT%H:%M:%S%z"`"
git push origin --force

# yesterday=`date -v '-1d' '+%Y-%m-%d'`
# commit_id=`git log --after="${yesterday} 00:00" --before="${yesterday} 23:59" --pretty=format:"%h" | head -n 1`
# git reset --hard ${commit_id}
