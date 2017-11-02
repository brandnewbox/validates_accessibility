require 'rspec'

require 'active_model'
require 'active_model/validations'
require 'active_record'
require 'action_view'
require 'validates_accessibility'
require 'virtus'
require 'support/model_helpers'
require 'support/config_helper'
require 'support/tag_matcher'

LOCALE_PATH = File.expand_path(File.dirname(__FILE__) + '/../lib/generators/validates_accessibility/templates/en.yml')
I18n.load_path.unshift(LOCALE_PATH)
I18n.available_locales = ['en', 'es']


class Document
  include Virtus.model
  include ActiveModel::Validations
  attribute :body, String
end

RSpec.configure do |c|
  c.mock_with :rspec
  c.include(TagMatcher)
  c.include(ModelHelpers)
  c.include(ConfigHelper)
  c.before do
    reset_validation_setup_for(Document)
  end

  c.filter_run_excluding :active_record => lambda {|version|
    !(::ActiveRecord::VERSION::STRING.to_s =~ /^#{version.to_s}/)
  }
end
