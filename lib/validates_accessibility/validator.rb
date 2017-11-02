require 'active_model'
require 'active_model/validator'
require 'validates_accessibility/standards/alt_missing'

module ValidatesAccessibility
  class Validator < ActiveModel::EachValidator

    STANDARDS = {
      :alt_missing => ValidatesAccessibility::Standards::AltMissing
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
      @standards_to_check.each do |standard|
        STANDARDS[standard].validate(record, attribute, value)
      end
    end

  end
end


# Compatibility with ActiveModel validates method which matches option keys to their validator class
ActiveModel::Validations::AccessibilityValidator = ValidatesAccessibility::Validator