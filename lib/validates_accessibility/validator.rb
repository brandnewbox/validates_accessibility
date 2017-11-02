require 'active_model'
require 'active_model/validator'

module ValidatesAccessibility
  class Validator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value == 'cat'
        record.errors.add(attribute, :alt_missing, options.merge(value: value))
      end
    end
  end
end


# Compatibility with ActiveModel validates method which matches option keys to their validator class
ActiveModel::Validations::AccessibilityValidator = ValidatesAccessibility::Validator