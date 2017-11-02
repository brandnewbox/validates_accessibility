# ValidatesAccessibility

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

## Standards

Borrowed from `http://wave.webaim.org/api/docs?format=xml`

| Key                  |      Title                               |  Summary                                                                                                            |
|----------------------|:----------------------------------------:|--------------------------------------------------------------------------------------------------------------------:|
| alt_missing          | Missing alternative text                 | Image alternative text is not present.                                                                              |
| alt_link_missing     | Linked image missing alternative text    | An image without alternative text results in an empty link.                                                         |
| alt_spacer_missing   | Spacer image missing alternative text    | A layout spacer image (which should have null/empty alternative text) does not have an alt attribute.               |
| alt_input_missing    | Image button missing alternative text    | Alternative text is not present for a form image button.                                                            |
| alt_area_missing     | Image map area missing alternative text  | Alternative text is not present for an image map area (hot spot).                                                   |
| alt_map_missing      | Image map missing alt attribute          | An image that has hot spots does not have an alt attribute.                                                         |
| server_image_map     | Server-side image map                    | A server-side image map is present.                                                                                 |
| longdesc_invalid     | Invalid longdesc                         | The longdesc attribute is not a URL.                                                                                |
| label_missing        | Missing form label                       | A form control does not have a corresponding label.                                                                 |
| label_empty          | Empty form label                         | A form label is present, but does not contain any content.                                                          |
| label_multiple       | Multiple form labels                     | A form control has more than one label associated with it.                                                          |
| title_invalid        | Missing or uninformative page title      | The page title is missing or not descriptive.                                                                       |
| language_missing     | Document language missing                | The language of the document is not identified.                                                                     |
| meta_refresh         | Page refreshes or redirects              | The page is set to automatically change location or refresh using a &lt;meta&gt; tag.                               |
| heading_empty        | Empty heading                            | A heading contains no content.                                                                                      |
| button_empty         | Empty button                             | A button is empty or has no value text.                                                                             |
| link_empty           | Empty link                               | A link contains no text.                                                                                            |
| link_skip_broken     | Broken skip link                         | A skip navigation link exists, but the target for the link does not exist or the link is not keyboard accessible.   |
| th_empty             | Empty table header                       | A &lt;th&gt; (table header) contains no text.                                                                       |
| blink                | Blinking content                         | Blinking content is present.                                                                                        |
| marquee              | Marquee                                  | A &lt;marquee&gt; element is present.                                                                               |

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
