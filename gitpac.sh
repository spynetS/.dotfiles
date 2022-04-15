#!/bin/sh

echo write the git url
read giturl

USER_HOME=$(eval echo ~${SUDO_USER})

cd ~/programs
git=$(basename $giturl)
folder=${git%.*}
git clone $giturl
echo $folder
cd ~/programs/$folder

makepkg -sic
