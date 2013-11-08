# GemAuditor

## Installation

Add this line to your application's Gemfile:

    gem 'gem_auditor'

And then execute:

    $ bundle

Put next line to Rakefile of checked project:

```ruby
load 'gem_auditor/lib/rake/analyzer.rake'
```


## Usage

rake -T

bundle exec rake gem_auditor:check_outdated_gems

## TODO

1. Specs
2. Publish gem to Rubygems

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
