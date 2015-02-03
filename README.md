microsite-18f
=========

This is an attempt to provide a command-line mechanism for cloning a
repo. 

This is purely experimental at present.  Our goal is to create the
fastest possible way to create a personal site.

To use, clone this repo onto a computer that has bash.

First, you'll want to copy the `.env.example` file to be `.env`.

```
mv .env.example .env
``` 

In the `.env` file, you'll need to set the following:

1. The name of the new repo you wish to create. (REPONAME)
2. A personal name (PERSONAL_NAME)
3. Your github account name under which you want to create the new
   repo. (GH_USER)
4. Your github password (GH_PASSWORD)
5. The URL to the site you intend to clone. (GIT_URL_TO_CLONE)
6.  The "organization" under which you wish the repo to be created. (GIT_ORGANIZATION). [Note: This is an optional setting.]

Then, when the `.env` file is prepared, it's simply a matter of running:

```
./create_gh_site.bash
```

Obviously, you could create new templates that had nothing to do with
18F and reuse this script.

If the site, such as
<https://github.com/MyInternetWebsite/microsite-template-18f>, which is
meant to a template, contains the token:

> YOUR_CONFIGURED_MICROSITE_NAME_HERE

It will be replaced with the personal name given as the second argument.

# Rationale

This code provides a programmatic way to generate new repos.  For
example, you could use it to create 10 repos for a class teaching
people how to use GitHub, but programmatically executing the script
10 times.

"With great power comes great responsibility." -- Spiderman

Be considerate of GitHub and their users.

