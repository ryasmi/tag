# Tag
> A [micro JavaScript library](http://microjs.com/#) for creating elements, inspired by [Laconic](https://github.com/joestelmach/laconic) and [React](facebook.github.io/react/).

[![Build Status](https://travis-ci.org/ryansmith94/tag.svg?branch=master)](https://travis-ci.org/ryansmith94/tag)
[![Dependencies](https://david-dm.org/ryansmith94/tag.svg?style=flat)](/package.json)
[![Dev Dependencies](https://david-dm.org/ryansmith94/tag/dev-status.svg?style=flat)](/package.json)
[![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/ryansmith94/tag?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

If you have a bug, enhancement, or question you can post it in the issues, however, please see the [contribution guidelines](/contributing.md) before doing so. You may also ask questions and chat on [Gitter](https://gitter.im/ryansmith94/tag).

## Users
Documentation can be found in the [docs](/docs) directory. Please see below for instructions on how to [download](#download) and [use](#use) tag. There are also a few [Plunks](#plunks) that demonstrate how to use Tag below.

### Download
Please follow any of the instructions below to download tag.
- [Bower](bower.io): run `bower install tag`.
- [NPM](npmjs.org): run `npm install tag`.
- [Git](http://git-scm.com/): run `git clone https://github.com/ryansmith94/tag.git tag`.
- [Download](https://github.com/ryansmith94/tag/archive/develop.zip): `https://github.com/ryansmith94/tag/archive/develop.zip`.

### Use
- [CommonJS](http://wiki.commonjs.org/wiki/CommonJS): `var tag = require('tag');`.
- [AMD](http://requirejs.org/docs/whyamd.html): `require(['tag'], function (tag) {})`.
- [Global](http://www.w3schools.com/js/js_scope.asp): `var tag = window.tag;`.

### Plunks
- [Todos](http://plnkr.co/edit/64UBfP?p=preview)
- [Image loading view](http://plnkr.co/edit/4X4N5E?p=preview)
- [Hackity hack](http://plnkr.co/edit/slmRLT?p=preview)

## Developers
You may contribute to this project via issues and pull requests, however, please see the [contribution guidelines](/contributing.md) before doing so.

### Getting Started
1. [Fork](/fork) the repository.
2. Clone your forked version of the repository.
3. Run `npm install`.
4. Change the code.
5. Run `npm test`. See the [build process](#build-process) below for more information.
6. Repeat from Step 4 or continue to step 7.
7. Commit and push your changes to Github.
8. Create a [pull request](/compare) on Github (ensuring that you follow the [guidelines](/contributing.md)).

### Directory Structure
- [src](/src) - Source code written in CoffeeScript.
- [spec](/spec) - Testing code written in CoffeeScript.
- [build](/build) - Compiled source written in JavaScript.
- [docs](/docs) - Documentation written in GitHub Markdown.

### Build Process
You should try to ensure that `npm test` or [`gulp`](http://gulpjs.com/) run without any errors before submitting a pull request.
