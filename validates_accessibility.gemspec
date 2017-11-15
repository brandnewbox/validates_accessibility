# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "validates_accessibility/version"

Gem::Specification.new do |spec|
  spec.name        = 'validates_accessibility'
  spec.version     = ValidatesAccessibility::VERSION
  spec.date        = '2017-11-01'
  spec.description = "We have a lot of projects that contractually require accessible content, this gem allows the application to validate user generated content and ensure that it meets those standards."
  spec.authors     = ["Nathan Clark", "Mark VanLandingham"]
  spec.email       = 'nathan@brandnewbox.com'

  spec.summary     = "Ruby gem to validate the accessibility of HTML content"
  spec.homepage    = 'http://github.com/brandnewbox/validates_accessibility'
  spec.license     = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails", "~> 4.2.0"
  spec.add_dependency "nokogiri"
  spec.add_development_dependency "rspec", "~> 3.6"
  spec.add_development_dependency "virtus"

end