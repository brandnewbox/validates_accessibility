module ValidatesAccessibility
  module Standards
    class H37
      def self.validate(record, attribute, doc)
        ['img','embed'].each do |element|
          doc.css("#{element}[alt='']").each do |element|
            record.errors.add(attribute,:a_alt_empty, element: element.to_html)
          end
          doc.css("#{element}:not([alt])").each do |element|
            record.errors.add(attribute,:a_alt_missing, element: element.to_html)
          end
        end
      end
    end
  end
end
