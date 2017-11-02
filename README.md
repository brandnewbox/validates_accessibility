# ValidatesTimeliness

* Source:  http://github.com/brandnewbox/validates_accessibility
* Issues:  http://github.com/brandnewbox/validates_accessibility/issues

## Description

We have a lot of projects that contractually require accessible content, this gem allows the application to validate user generated content and ensure that it meets those standards.

## Features

* None as of yet.

## Installation

  # in Gemfile
  gem 'validates_accessibility'

  # Run bundler
  $ bundle install

Then run
  
  $ rails generate validates_accessibility:install

This creates configuration initializer and locale files. In the initializer, there are a number of config
options to customize the plugin.

## Examples

```Ruby
validates_accessibility :body
```

## Usage

To validate a model with a date, time or datetime attribute you just use the
validation method

```Ruby
class Page < ActiveRecord::Base
  validates_accessibility :body, :heading_max => 3, :heading_min => 5
  # or
  validates :body, :validates_accessibility => {:heading_max => 3, :heading_min => 5}
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Error Messages

Using the I18n system to define new defaults:

  en:
    errors:
      messages:
        invalid_heading: "is an invalid heading"
        missing_alt: "is missing alt text"

## Contributors

## Maintainers

* {Nathan Colgate}[http://github.com/nathancolgate]

## License

Copyright (c) 2017 Nathan Colgate, released under the MIT license
