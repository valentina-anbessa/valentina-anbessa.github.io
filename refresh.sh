#!/bin/sh

cd /home/youtube/valentina-anbessa.github.io
# git reset --hard b5a9034cbe0658647dc432d3965a22298b7a347c 
/usr/bin/docker exec -i youtube-app-1 python app/refresh_static_site.py > docker.log 2>&1
mv /home/youtube/Youtube/index.html .
git add .
m=$(git commit -m "refresh index.html at `date +"%Y-%m-%dT%H:%M:%S%z"`")
r=$(echo $m | grep "nothing to commit")
if [ $? != 0 ]
then
    git push origin --force
fi

# yesterday=`date -v '-1d' '+%Y-%m-%d'`
# commit_id=`git log --after="${yesterday} 00:00" --before="${yesterday} 23:59" --pretty=format:"%h" | head -n 1`
# git reset --hard ${commit_id}
