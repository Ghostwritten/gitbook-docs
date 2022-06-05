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
repo="github.com/${user}/gitbook-demo.git"

rm -rf About.md 
book sm
cp SUMMARY.md About.md
sed -i 's/Gitbook Demo/目录/g' About.md
python3 gitbook-auto-summary.py  .

delete_README() {
lines_README=`cat SUMMARY-GitBook-auto-summary.md  |grep "*" |grep README |grep -v "序言"  | awk '{print $2}'`

for line_README in $lines_README
do 
 echo $line_README
  line_README=${line_README//\//\\\/}
  line_README=${line_README//\[/\\[}
  line_README=${line_README//\]/\\]}
  line_README=${line_README//\(/\\\(}
  line_README=${line_README//\)/\\\)}
  line_README=${line_README//\-/\\\-}
 sed -r -i "/$line_README/d" SUMMARY-GitBook-auto-summary.md
done

}

add_README() {
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

mv SUMMARY-GitBook-auto-summary.md SUMMARY.md

}

push_master(){

gitbook build 

git add .
git commit -m "${update}"
git push origin master

}
push_gh-pages(){
cd _book
git init
git remote add origin https://${repo}
git add . 
git commit -m "${update} For Github Pages"
git branch -M master
git push --force --quiet "https://${TOKEN}@${repo}" master:gh-pages

}

delete_README
add_README
push_master
push_gh-pages
