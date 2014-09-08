#!/bin/bash
echo "Creating reponame: $1 for a cool person named: $2 using github user: $3 with a github password passed as the fourth argument"
export REPONAME=$1
export PERSONAL_NAME=$2
export GH_USER=$3
export GH_PASSWORD=$4
export GIT_URL_TO_CLONE=$5
export GIT_ORGANIZATION=$6
export GIT_REPONAME_TO_CLONE=$7

echo 'https://api.github.com/orgs/'$GIT_ORGAINZATION'/repos'

curl --user "$GH_USER:$GH_PASSWORD" --request POST --data '{"name" : "'$REPONAME'", "description": "This is a repository for '$PERSONAL_NAME'",   "private": false,  "has_issues": true,  "has_wiki": true,  "has_downloads": true}' 'https://api.github.com/orgs/'$GIT_ORGANIZATION'/repos'

mkdir testpush
cd testpush


git clone $GIT_URL_TO_CLONE
cd $GIT_REPONAME_TO_CLONE
git checkout gh-pages
cat index.html | sed 's/YOUR_CONFIGURED_MICROSITE_NAME_HERE/'$PERSONAL_NAME'/' > index.html.x
mv index.html.x index.html
git add index.html
git commit -m "First pages commit"
git remote set-url origin https://github.com/$GIT_ORGANIZATION/$REPONAME.git
git push origin gh-pages
cd ..
rm -rf $GIT_REPONAME_TO_CLONE
cd ..
rm -rf testpush
