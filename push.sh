#!/bin/sh

LAST_COMMIT_MESSAGE="$(git log --no-merges -1 --pretty=%B)"
git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git add --force build/ccxt.browser.js
git commit -a -m "${COMMIT_MESSAGE}" -m '[ci skip]'
git tag -a "${COMMIT_MESSAGE}" -m "${LAST_COMMIT_MESSAGE}" -m "" -m "[ci skip]"
git remote remove origin
git remote add origin https://wmturner:pUCtPf9f7Ij9mRbItoVdJQ@github.com/Simplicify/ccxt
git push origin --tags HEAD:master
