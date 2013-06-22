#!/bin/sh

REPO_URL="https://github.com/nark/wired-wiki.git"
REPO_PATH="/tmp/wired-wiki"
WIKI_PATH="/var/www/wired/htdocs/wiki/"

# clone the wiki locally
if [ ! -d $REPO_PATH ]; then
        git clone $REPO_URL $REPO_PATH
        cd $REPO_PATH
else
        cd $REPO_PATH
        git pull
fi

# build static HTML with Markdoc
markdoc build

# publish on webserver via rsync
rsync -a "${REPO_PATH}/html/" $WIKI_PATH