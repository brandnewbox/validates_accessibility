module ValidatesAccessibility
  module Standards
    class TwentyTwoA
      def self.validate(record, attribute, doc)
        ['img','embed'].each do |element|
          doc.css("#{element}[alt='']").each do |element|
            record.errors.add(attribute,:alt_empty, element: element.to_html)
          end
          doc.css("#{element}:not([alt])").each do |element|
            record.errors.add(attribute,:alt_missing, element: element.to_html)
          end
        end
        
        doc.css("object").each do |element|
          unless element.children.detect {|c| c.is_a?(Nokogiri::XML::Text)}
            record.errors.add(attribute,:descriptive_content_missing, element: element.to_html)
          end
        end
      end
    end
  end
end
