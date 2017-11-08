require 'active_model'
require 'active_model/validator'
require 'validates_accessibility/standards/h35.rb'
require 'validates_accessibility/standards/h37.rb'
require 'validates_accessibility/standards/h46.rb'
require 'validates_accessibility/standards/h53.rb'
require 'validates_accessibility/standards/h65.rb'
require 'validates_accessibility/standards/h96.rb'

module ValidatesAccessibility
  class Validator < ActiveModel::EachValidator

    STANDARDS = {
      :h35 => ValidatesAccessibility::Standards::H35,
      :h37 => ValidatesAccessibility::Standards::H37,
      :h46 => ValidatesAccessibility::Standards::H46,
      :h53 => ValidatesAccessibility::Standards::H53,
      :h65 => ValidatesAccessibility::Standards::H65,
      :h96 => ValidatesAccessibility::Standards::H96
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
ActiveModel::Validations::AccessibilityValidator = ValidatesAccessibility::Validator