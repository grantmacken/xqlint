#GRANTMACKEN ROUGH NOTES:

Add 'config.json' file so user can
 - set default options passed to xQlint
 - specify alt paths for lexer and parser

Add json files to lib/compliler dir in order to 
separate out configurable 'data sets' from procedural code

- lib/compiler/28msec.json
  this is is read when the *processor* option set to '28msec'
  either in config.json or passed as an param to xqlint

  The idea is to have one file for each processor

- lib/compiler/default_function.namespaces.json
- lib/compiler/namespaces.json

Modify main entry point lib/xqlint.js
 TODO! 
at the moment JSONiqParser is set by reading file extension
so remove then
 - default to one default lexer/parser
 - alt parser/lexer should be set via config

If we need an alt lexer/parser enabled for xQuery processor dependent requirements, the idea is to create alt lexer/parser ebnf covering these requirements and regenerate the lexer/parser js files.
If the config files has an alt key then the alternate lexer/parser will be used.

 TODO! 
 - try xQuery 3.1 : test for arrow expression
 - try eXist ebnf covering eXist specfic 'update' expressions

Add bin exec 'xQlint'
  that accepts stdin so linting can happen on-buffer-text-change, rather than on-file-change


Anything else?
<!--

Look at  using xqlint to implement Language Server Protocol stuff

 - hover:  ( in vim normal mode )
If a language server holds the source text AST in memory
then an 'xQinfo' function that accepts line and col params
could return AST parser context. There would no need to resend source text.

 - format  'xQformat' a stdio buffer not a file

 - completer  given insert position belongs to a prior known AST parser context
 held be the language server there should be no need to resend source text and reparse

https://github.com/wcandillon/xqlint/issues/58
-->

#XQLint
[![Build Status](http://img.shields.io/travis/wcandillon/xqlint/master.svg?style=flat)](https://travis-ci.org/wcandillon/xqlint) [![NPM version](http://img.shields.io/npm/v/xqlint.svg?style=flat)](http://badge.fury.io/js/xqlint) [![Code Climate](http://img.shields.io/codeclimate/github/wcandillon/xqlint.svg?style=flat)](https://codeclimate.com/github/wcandillon/xqlint)

## JSONiq & XQuery Code Quality Tool

XQLint parses XQuery & JSONiq files and returns errors and warnings based on static code analysis.
![example](http://i.imgur.com/86jU7C1.png)

## Installation

Install Node.js and NPM for your system (Mac, Windows or Linux). And install the command line tool using:

```bash
$ npm install xqlint -g
```
## Usage

### Lint

```bash
$ xqlint lint <path> [-s, --style-check <yes, no>]
```
![result](https://dl.dropboxusercontent.com/u/1487285/Screenshot%202014-04-07%2011.06.31.png)

### Print AST as XML

```bash
$ xqlint ast <path>
```

### Syntax Highlighting

```bash
$ xqlint highlight <path>
```

## Development

If you'd like to hack on xqlint itself:

```bash
git clone git@github.com:wcandillon/xqlint.git
cd xqlint
npm install
grunt
```

### Run tests

```bash
grunt vows
```

### Generate Parsers

```bash
grunt parsers
```

##Who is using this project?
* [28.io cli tool](https://github.com/28msec/28)
* [Atom Editor](https://atom.io/packages/language-jsoniq)
* [ACE, aka the Cloud9 editor](https://github.com/ajaxorg/ace), [view demo](http://try.zorba.io).
* [XQLint Grunt Task](https://github.com/wcandillon/grunt-xqlint)
* [XQLint Gulp Plugin](https://github.com/wcandillon/gulp-xqlint)
* [eXide](https://github.com/wolfgangmm/eXide), a web-based XQuery IDE for eXist-db, [view demo](http://exist-db.org/exist/apps/eXide/).
* [atom-existdb](https://github.com/wolfgangmm/atom-existdb), an Atom editor integration package for eXist-db.
