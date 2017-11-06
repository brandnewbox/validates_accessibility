module ValidatesAccessibility
  module Standards
    class H35
      def self.validate(record, attribute, doc)
        ['applet','embed'].each do |element|
          doc.css("#{element}[alt='']").each do |element|
            record.errors.add(attribute,:a_alt_empty, element: element.to_html)
          end
          doc.css("#{element}:not([alt])").each do |element|
            record.errors.add(attribute,:a_alt_missing, element: element.to_html)
          end
          doc.css("applet").each do |element|
            unless element.children.detect {|c| c.is_a?(Nokogiri::XML::Text)}
              record.errors.add(attribute,:a_descriptive_content_missing, element: element.to_html)
            end
          end
        end
      end
    end
  end
end
