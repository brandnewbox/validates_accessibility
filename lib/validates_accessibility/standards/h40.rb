module ValidatesAccessibility
  module Standards
    class H40
      def self.validate(record, attribute, doc)
        doc.css("dt").each do |term|
          if term.parent.name == 'dl'
            return # valid option
          end
        end
        doc.css("dd").each do |term|
          if term.parent.name == 'dl'
            return # valid option
          end
        end
        record.errors.add(attribute,:dl_tag_missing)
      end
    end
  end
end