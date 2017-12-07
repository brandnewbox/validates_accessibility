require 'rspec'

require 'net/http'
require 'active_model'
require 'active_model/validations'
require 'active_record'
require 'action_view'
require 'validates_accessibility'
require 'virtus'
require 'support/model_helpers'
require 'support/config_helper'
require 'support/tag_matcher'

require 'validates_accessibility/warning_standards/h69.rb'
require 'validates_accessibility/warning_standards/h71.rb'

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

class Analysis
  attr_accessor :source
  attr_accessor :errors
  attr_accessor :warnings
  attr_accessor :errorsReported
  attr_accessor :warningsReported

  def initialize(source, options)
    @@source = source
    @@errors = []
    @@warnings = []
    @@errorsReported = false
    @@warningsReported = false
    @@this = self
  end

  def generateReport
    Prawn::Document.generate("report.pdf") do
      text "ERRORS", :align => :center
      @@errors.each do |error|
        text error
      end

      text "\nWARNINGS", :align => :center
      @@warnings.each do |warning|
        text warning
      end
    end
  end

  def runWarningTests
    RSpec.describe WarningValidator::Warner, "Plugin" do
      before do
        Document.show_warnings_of :body
      end
      after do 
        @@warningsReported = true
        if @@errorsReported == true
          @@this.generateReport
        end
      end
      it "Testing for accessiblity concerns "+ ENV['URL']+ENV['TEMPLATE'] do
        source = Net::HTTP.get(ENV['URL'], ENV['TEMPLATE']).to_s
        c = Document.new
        c.body = source
        expect(c).to be_invalid
        @@warnings = c.errors.messages[:body]
      end
    end
  end

  def runErrorTests
    RSpec.describe ValidatesAccessibility::Validator, "Plugin" do
      before do
        Document.validates_accessibility_of :body
      end
      after do 
        @@errorsReported = true
        if @@warningsReported == true
          @@this.generateReport
        end
      end
      it "Testing accessiblity failures of "+ ENV['URL']+ENV['TEMPLATE'] do
        source = Net::HTTP.get(ENV['URL'], ENV['TEMPLATE']).to_s
        c = Document.new
        c.body = source
        expect(c).to be_invalid
        @@errors = c.errors.messages[:body]
      end
    end
  end

end