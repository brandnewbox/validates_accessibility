module ActiveModel
  module Validations

    module HelperMethods
      
      def validates_accessibility_of(*attr_names)
        accessibility_validation_for attr_names
      end

      def accessibility_validation_for(attr_names, type=nil)
        options = _merge_attributes(attr_names)
        options.update(:type => type) if type
        validates_with AccessibilityValidator, options
      end
    end

  end
end