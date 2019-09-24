#!/bin/bash

cd RepositoryName/

LOG=$1

git add .
git status
git commit -m"${LOG}"
git pull origin master
git push origin master
