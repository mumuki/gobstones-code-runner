#!/usr/bin/zsh

# nvm use 7
./build.sh
cp -r dist/gobstones-code-runner.html ../gobstones-web/app/bower_components/gobstones-code-runner/dist/gobstones-code-runner.html
rm -rf ../gobstones-web/.tmp ../gobstones-web/dist
