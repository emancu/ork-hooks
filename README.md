ork-hooks
==============

[![Gem Version](https://badge.fury.io/rb/ork-hooks.png)](http://badge.fury.io/rb/ork-hooks)
[![Build Status](https://secure.travis-ci.org/emancu/ork-hooks.png)](http://travis-ci.org/emancu/ork-hooks)
[![Code Climate](https://codeclimate.com/github/emancu/ork-hooks.png)](https://codeclimate.com/github/emancu/ork-hooks)
[![Coverage Status](https://coveralls.io/repos/emancu/ork-hooks/badge.png)](https://coveralls.io/r/emancu/ork-hooks)
[![Dependency Status](https://gemnasium.com/emancu/ork-hooks.png)](https://gemnasium.com/emancu/ork-hooks)


Timestamps for your Ork Models

## Dependencies

`ork-hooks` requires:

* Ruby 1.9 or later.
* `riak-client` to connect to **Riak**.
* `ork` 0.1.4 or later.

Install Dependencies using `dep` is easy as run:

    $ dep insatll

## Installation

Install [Riak](http://basho.com/riak/) with your package manager:

    $ brew install riak

Or download it from [Riak's download page](http://docs.basho.com/riak/latest/downloads/)

Once you have it installed, you can execute `riak start` and it will run on `localhost:8098` by default.

If you don't have `ork-hooks`, try this:

    $ gem install ork-hooks


## Overview

`Ork::Hooks` creates the following hooks

- before_create
- before_delete
- before_update
- before_save

- after_create
- after_delete
- after_update
- after_save

## Getting started

Include `Ork::Hooks` module in your `Ork::Document` class.

```ruby
class SomeDocument
  include Ork::Document
  include Ork::Hooks

  attribute :message
end
```

Enjoy your models with hooks!

## Running the Tests

Adjust the variable to point to a test riak database. Default is `http://localhost:8098`

```bash
$ ORK_RIAK_URL='http://localhost:8198' rake
```
