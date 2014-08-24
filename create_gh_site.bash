export REPONAME=robsfirstautoreposite
export PERSONAL_NAME=Aragorn

curl --user "robertlread:$GITHUB_PASSWORD" --request POST --data '{"name" : "robsfirstautoreposite", "description": "This is your first repository",  "homepage": "https://someurlThatAlanWillCreate",  "private": false,  "has_issues": true,  "has_wiki": true,  "has_downloads": true}' https://api.github.com/orgs/MyInternetWebsite/repos

cd /Users/robertread/projects/testpush

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
