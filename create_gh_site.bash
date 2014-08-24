#!/bin/bash
echo "Creating reponame: $1 for a cool person named: $2 using github user: $3 with a github password passed as the fourth argument"
export REPONAME=$1
export PERSONAL_NAME=$2
export GH_USER=$3
export GH_PASSWORD=$4

curl --user "$GH_USER:$GH_PASSWORD" --request POST --data '{"name" : "'$REPONAME'", "description": "This is a repository for '$PERSONAL_NAME'",  "homepage": "https://someurlThatAlanWillCreate",  "private": false,  "has_issues": true,  "has_wiki": true,  "has_downloads": true}' https://api.github.com/orgs/MyInternetWebsite/repos

mkdir testpush
cd testpush


git clone https://github.com/MyInternetWebsite/microsite-template0.git
cd microsite-template0
git checkout gh-pages
cat index.html | sed 's/663c8bbc10b66148ed44763d59a2ee4e/'$PERSONAL_NAME'/' > index.html.x
mv index.html.x index.html
git add index.html
git commit -m "First pages commit"
git remote set-url origin https://github.com/MyInternetWebsite/$REPONAME.git
git push origin gh-pages
cd ..
rm -rf microsite-template0
cd ..
rm -rf testpush
