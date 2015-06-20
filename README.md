# Warder

[![Build Status](https://travis-ci.org/yltsrc/warder.png?branch=master)](https://travis-ci.org/yltsrc/warder)
[![Code Climate](https://codeclimate.com/github/yltsrc/warder.png)](https://codeclimate.com/github/yltsrc/warder)
[![Dependency Status](https://gemnasium.com/yltsrc/warder.png)](https://gemnasium.com/yltsrc/warder)

## Getting started

Main goal of this project was to provide you tool, which will help make code
better. I used these tools for a while and can provide some tips.

Just to start with warder, it would be great to do something simple.
And I will recommend to start with checking your bundle for security issues

    $ warder --bundle-audit

Sooner or later you will start with code cleanup. There are two main ways to
deal with it, depending what you plan to achieve. If you are interested in clean
code, according to style guides, you may want to use

    $ warder --style-guide

But if you want to see you code OOP-friendly, then you need different approach

    $ warder --code-smells

Next steps for stylish code are:

    $ warder --code-duplication
    $ warder --magick-numbers

And for OOP-style code next steps will be:

    $ warder --code-complexity

Then you can apply everything is left. But I strongly recommend to add
validations one by one, right after all issues are fixed from previous one.
Now it is not possible to compare results on feature branches without scripting,
so you must be careful, if you want to use all suitable validators and results
are not as good as it can be.

There are few rails specific validators, but the rules are the same. Security is
the first priority:

    $ warder --rails-security

You may also want to see some advice, regarding rails best practices:

    $ warder --rails-advice

but be careful with it, some reported advices may conflict with another
validators.

You may also see, how your rails app meets Sandi Metz rules:

    $ warder --sandi-rules

## Installation

Add this line to your application's Gemfile:

    gem 'warder'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install warder

## Usage

First of all, RTFM!

    $ warder --help

to see all supported scanners.
If you are too lazy, you will be confused with results.

    $ warder
    
to see that everything is good (actually no one validator used) and you don't
need to fix any issues :)

You also can use shortcuts:

    $ warder --all
    
to run all validations, even ones you don't really need.

To run only rails related validations:

    $ warder --rails

or to validate your ruby project:

    $ warder --all --no-rails

if you so tired looking at your code issues, you can use silent mode

    $ warder --quiet
    
and you just will get result by exit code.

But if you, or your CI is really interested in statistics, there is statistics
mode for you:

    $ warder --quiet --stats

if you working on multiple projects, you can pass path to another project
as an argument:

    $ warder --quiet /path/to/another/project
    
The best thing I can do with warder is validate project itself, so anyone can
see, that it is not so hard to write good ruby code. Just check build status on
[Travis CI](https://travis-ci.org/yltsrc/warder).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
