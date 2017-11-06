module ValidatesAccessibility
  module Standards
    class H53
      def self.validate(record, attribute, doc)
        doc.css("object").each do |element|
          unless element.children.detect {|c| c.is_a?(Nokogiri::XML::Text)}
            record.errors.add(attribute,:a_descriptive_content_missing, element: element.to_html)
          end
        end
      end
    end
  end
end
