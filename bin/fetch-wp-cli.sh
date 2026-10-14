#!/usr/bin/env bash

if [ ! $(which git) ]; then
  echo "Error: git is not installed."
  exit 1
fi

if [ ! -f "$(pwd)/hime-nihongo-app-plugin.php" ]; then
  echo "You should run this script in the root of the plugin."
  exit 1
fi

if [ ! -d ./tests/wp-cli ]; then
  git clone --quiet 'https://github.com/wp-cli/wp-cli.git' ./tests/wp-cli
  cd ./tests/wp-cli
else
  cd ./tests/wp-cli && git checkout main --quiet && git fetch --quiet && git pull --quiet
  git branch | grep -v "main" | xargs git branch -D --quiet
fi

LATEST=$(git describe --tags $(git rev-list --tags --max-count=1))
git checkout tags/$LATEST -b $LATEST
