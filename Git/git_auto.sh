#!/bin/bash

cd RepositoryName/

LOG=$1

git add .
git status
git commit"${LOG}"
git pull origin master
git push origin master
