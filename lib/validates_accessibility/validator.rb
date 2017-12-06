require 'net/http'
require 'active_model'
require 'active_model/validator'
require 'validates_accessibility/error_standards/h24.rb'
require 'validates_accessibility/error_standards/h25.rb'
require 'validates_accessibility/error_standards/h28.rb'
require 'validates_accessibility/error_standards/h30.rb'
require 'validates_accessibility/error_standards/h32.rb'
require 'validates_accessibility/error_standards/h35.rb'
require 'validates_accessibility/error_standards/h36.rb'
require 'validates_accessibility/error_standards/h37.rb'
require 'validates_accessibility/error_standards/h39.rb'
require 'validates_accessibility/error_standards/h40.rb'
require 'validates_accessibility/error_standards/h46.rb'
require 'validates_accessibility/error_standards/h53.rb'
require 'validates_accessibility/error_standards/h57.rb'
require 'validates_accessibility/error_standards/h59.rb'
require 'validates_accessibility/error_standards/h62.rb'
require 'validates_accessibility/error_standards/h63.rb'
require 'validates_accessibility/error_standards/h64.rb'
require 'validates_accessibility/error_standards/h65.rb'
require 'validates_accessibility/error_standards/h73.rb'
require 'validates_accessibility/error_standards/h76.rb'
require 'validates_accessibility/error_standards/h91.rb'
require 'validates_accessibility/error_standards/h95.rb'
require 'validates_accessibility/error_standards/h96.rb'

module ValidatesAccessibility
  class Validator < ActiveModel::EachValidator

    STANDARDS = {
      :h24 => ValidatesAccessibility::Standards::H24,
      :h25 => ValidatesAccessibility::Standards::H25,
      :h28 => ValidatesAccessibility::Standards::H28,
      :h30 => ValidatesAccessibility::Standards::H30,
      :h32 => ValidatesAccessibility::Standards::H32,
      :h35 => ValidatesAccessibility::Standards::H35,
      :h36 => ValidatesAccessibility::Standards::H36,
      :h37 => ValidatesAccessibility::Standards::H37,
      :h39 => ValidatesAccessibility::Standards::H39,
      :h40 => ValidatesAccessibility::Standards::H40,
      :h46 => ValidatesAccessibility::Standards::H46,
      :h53 => ValidatesAccessibility::Standards::H53,
      :h57 => ValidatesAccessibility::Standards::H57,
      :h59 => ValidatesAccessibility::Standards::H59,
      :h62 => ValidatesAccessibility::Standards::H62,
      :h63 => ValidatesAccessibility::Standards::H63,
      :h64 => ValidatesAccessibility::Standards::H64,
      :h65 => ValidatesAccessibility::Standards::H65,
      :h73 => ValidatesAccessibility::Standards::H73,
      :h76 => ValidatesAccessibility::Standards::H76,
      :h91 => ValidatesAccessibility::Standards::H91,
      :h95 => ValidatesAccessibility::Standards::H95,
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