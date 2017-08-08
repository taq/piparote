# Piparote

![Piparote](https://github.com/taq/piparote/raw/master/piparote.png)

Another way to use Ruby object methods like pipes.

After reading [an
article](https://6ftdan.com/allyourdev/2017/08/03/elixir-envy-%e1%90%85-ruby/)
about Elixir's pipe operator and some implementation people made on Ruby, I made
this one as an exercise. Not sure if is good for production use.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'piparote'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install piparote

## Usage

You can require the gem, include and use the `Piparote` module like this (here,
using Nokogiri to parse my website):

```ruby
require 'uri'
require 'open-uri'
require 'nokogiri'
require 'piparote'

include Piparote
include Nokogiri

puts 'http://eustaquiorangel.com'.
   URI.parse.
   open.read.
   HTML.parse.
   css('h2').
   map { |h2| h2.text }.
   join(' - ')

=> Desenvolvedor, pai, metalhead - Publicado em Developer - E o carro estava na
garagem ... - Driver Driven Development
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/taq/piparote.
