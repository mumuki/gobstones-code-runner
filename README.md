# \<gobstones-code-runner\>

Element providing code runner interface for Gobstones Web

## Install Development Environment

First, make sure you have the [Polymer CLI](https://www.npmjs.com/package/polymer-cli) and Bower installed. 

```Bash
$ npm install -g bower
$ npm install -g polymer-cli
```

Then, run `bower install`

## Viewing Your Application

```
$ polymer serve
```

## Building Your Application

```
$ polymer build
```

This will create a `dist/gobstones-code-runner.html` file.

## Running Tests

```
$ polymer test
```

Your application is already set up to be tested via [web-component-tester](https://github.com/Polymer/web-component-tester). Run `polymer test` to run your application's test suite locally.

## Deploy Demo to gobstones.github.io/gobstones-code-runner

Just create a folder and run gp.sh with parameters:

```bash
mkdir temp
cd temp
../gp.sh gobstones gobstones-code-runner dev
cd ..
rm -rf temp
```

or simply execute ./deploy-gh-pages.sh

## Gem wrapper

This module can also be deployed a ruby gem. `gobstones-code-runner` works with Ruby 2.3.1

```bash
cd gem
rake wrapper:wrap
bundle install
bundle exec rspec
```

## Building

This command will build a minified .html file with all included:

```bash
./build.sh
```

## Tagging and releasing

```bash
./tag.sh
```
