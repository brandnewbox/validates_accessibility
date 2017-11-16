module ValidatesAccessibility
  module Standards
    class H40
      def self.validate(record, attribute, doc)
        doc.css("dt").each do |term|
          if term.parent.name != 'dl'
            return record.errors.add(attribute,:H40_dl_tag_missing)
          end
        end
        doc.css("dd").each do |term|
          if term.parent.name != 'dl'
            return record.errors.add(attribute,:H40_dl_tag_missing)
          end
        end
      end
    end
  end
end