export REPONAME=robsfirstautoreposite
export PERSONAL_NAME=Aragorn

curl --user "robertlread:$GITHUB_PASSWORD" --request POST --data '{"name" : "robsfirstautoreposite", "description": "This is your first repository",  "homepage": "https://someurlThatAlanWillCreate",  "private": false,  "has_issues": true,  "has_wiki": true,  "has_downloads": true}' https://api.github.com/orgs/MyInternetWebsite/repos

cd /Users/robertread/projects/testpush

git clone https://github.com/MyInternetWebsite/$REPONAME.git
cd $REPONAME
touch README.md
git add README.md
git commit -m "first commit"
git push -u origin master
git checkout --orphan gh-pages
git rm -rf .
echo "$PERSONAL_NAME is cool" > index.html
git add index.html
git commit -a -m "First pages commit"
git push origin gh-pages


