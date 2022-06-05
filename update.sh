#!/bin/bash

# author: ghostwritten
# date:   01/06 2022
# description: deploy Github Pages

# ##############################################################################
set -o nounset

FILE_NAME="update.sh"
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
python3 gitbook-auto-summary.py  .

dirs=`grep -E '\- ' SUMMARY-GitBook-auto-summary.md  | awk '{print $2}'`

for dir in $dirs
do
  dir_README=`grep -E "\[${dir}\]" SUMMARY.md | sed 's/^[ \t]*//g'`
  dir_README=${dir_README//\//\\\/}
  dir_README=${dir_README//\[/\\[}
  dir_README=${dir_README//\]/\\]}
  dir_README=${dir_README//\(/\\\(}
  dir_README=${dir_README//\)/\\\)}
  dir_README=${dir_README//\-/\\\-}
  sed -r -i "s#\\- ${dir}\$#$dir_README#g" SUMMARY-GitBook-auto-summary.md
done

cp -r SUMMARY-GitBook-auto-summary.md SUMMARY.md

gitbook build 

git remote add origin https://${repo}
git add .
git commit -m "${update}"
git push origin master

cd _book
git init
git remote add origin https://${repo}
git add . 
git commit -m "${update} For Github Pages"
git branch -M master
git push --force --quiet "https://${TOKEN}@${repo}" master:gh-pages
