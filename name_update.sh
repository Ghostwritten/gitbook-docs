#!/bin/bash

# author: ghostwritten
# date:   01/06 2022
# description: deploy Github Pages

# ##############################################################################
set -o nounset

FILE_NAME="deploy"
FILE_VERSION="v1.0"
BASE_DIR="$( dirname "$( readlink -f "${0}" )" )"


if [ $# != 1 ] ; then
  echo "USAGE: $0 something "
  echo " e.g.: $0 update github pages"
  exit 1;
fi

update=$1
#token=$2


user='Ghostwritten'
email='1zoxun1@gmail.com'
repo="github.com/${user}/gitbook-docs.git"

book sm
cp -f SUMMARY.md About.md


push_master(){

gitbook build 

git add .
git commit -m "${update}"
git push origin master

}
push_gh-pages(){
cp -f About.md _book/README.md
cd _book
git init
git remote add origin https://${repo}
git add . 
git commit -m "${update} For Github Pages"
git branch -M master
git push --force --quiet "https://${TOKEN}@${repo}" master:gh-pages

}

push_master
push_gh-pages
