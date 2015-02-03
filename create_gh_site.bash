#!/bin/bash

filename=".env"
while read -r line
do
    echo $line
    name="$line"
    export "$name"
done < "$filename"

if [ -z "$GIT_ORGANIZATION" ]; then
    echo 'https://api.github.com/user/repos'
    curl --user "$GH_USER:$GH_PASSWORD" --request POST --data '{"name" : "'$REPONAME'", "description": "This is a microsite repository",   "private": false,  "has_issues": true,  "has_wiki": true,  "has_downloads": true}' 'https://api.github.com/user/repos'
    GIT_ORGANIZATION=$GH_USER
else
    echo 'https://api.github.com/orgs/'$GIT_ORGANIZATION'/repos'
    curl --user "$GH_USER:$GH_PASSWORD" --request POST --data '{"name" : "'$REPONAME'", "description": "This is a microsite repository",   "private": false,  "has_issues": true,  "has_wiki": true,  "has_downloads": true}' 'https://api.github.com/orgs/'$GIT_ORGANIZATION'/repos'
fi

echo $GIT_URL_TO_CLONE
git clone $GIT_URL_TO_CLONE $REPONAME
cd $REPONAME
git checkout gh-pages
sed -i "" "s/YOUR_CONFIGURED_MICROSITE_NAME_HERE/$PERSONAL_NAME/" index.html
git commit -am "First pages commit"

git remote set-url origin git@github.com:$GIT_ORGANIZATION/$REPONAME.git
git remote add upstream $GIT_URL_TO_CLONE
git push origin gh-pages