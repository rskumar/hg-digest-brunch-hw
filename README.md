hg-digest-brunch-hw
=================

A [Brunch](http://brunch.io) plugin for cache busting urls using the SHA digest of the current mercurial revision. 

## Usage

Add the `DIGEST` token to any file paths you want to cache bust:

    <link rel="stylesheet" href="stylesheets/app.css?DIGEST">
    background-image: url('/images/hello.png?DIGEST');
    canvas.image "/images/sprite.png?DIGEST", 0, 0, 150, 150
    etc.

Build with `brunch build --production`, file paths are now cache busted:

    <link rel="stylesheet" href="stylesheets/app.css?aca2b34">
    background-image: url('/images/hello.png?aca2b34');
    canvas.image "/images/sprite.png?aca2b34", 0, 0, 150, 150
    etc.


##

## Credit

forked and modified from https://github.com/BoLaMN/hg-digest-brunch
