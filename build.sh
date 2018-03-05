mkdir -p dist
vulcanize --inline-scripts --inline-css --strip-exclude "bower_components/polymer/polymer.html" gobstones-code-runner.html > dist/gobstones-code-runner.html
