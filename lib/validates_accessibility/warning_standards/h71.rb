module WarningValidator
  module Standards
    class H71
      def self.validate(record, attribute, doc)
        fieldsets = 0
        doc.css("fieldset").each do |fieldset|
          fieldsets += 1
        end
        if fieldsets < 1
          record.errors.add(attribute,:H71_fieldset_missing)
        end
      end
    end
  end
end