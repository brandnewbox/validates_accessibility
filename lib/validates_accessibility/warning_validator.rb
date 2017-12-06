require 'net/http'
require 'active_model'
require 'active_model/validator'
require 'validates_accessibility/warning_standards/h69.rb'
require 'validates_accessibility/warning_standards/h71.rb'

module WarningValidator
  class Warner < ActiveModel::EachValidator

    STANDARDS = {
      :h69 => WarningValidator::Standards::H69,
      :h71 => WarningValidator::Standards::H71,
    }.freeze

    def initialize(options)
      if options.has_key?(:only)
        @standards_to_check = STANDARDS.keys & options[:only]
      elsif options.has_key?(:except)
        @standards_to_check = STANDARDS.keys - options[:except]
      else
        @standards_to_check = STANDARDS.keys
      end
      super
    end

    def validate_each(record, attribute, value)
      @doc = Nokogiri::HTML(value)
      @standards_to_check.each do |standard|
        STANDARDS[standard].validate(record, attribute, @doc)
      end
    end

  end
end


# Compatibility with ActiveModel validates method which matches option keys to their validator class
ActiveModel::Validations::AccessibilityWarner = WarningValidator::Warner