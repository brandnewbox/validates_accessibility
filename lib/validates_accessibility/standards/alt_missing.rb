module ValidatesAccessibility
  module Standards
    class AltMissing
      def self.validate(record, attribute, value)
        unless value.include?('cat')
          record.errors[attribute] << :alt_missing
        end
      end
    end
  end
end
