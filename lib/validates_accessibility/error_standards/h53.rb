module ValidatesAccessibility
  module Standards
    class H53
      def self.validate(record, attribute, doc)
        doc.css("object").each do |element|
          if !(element.children.detect {|c| c.is_a?(Nokogiri::XML::Text) || (c['alt'] != '' && c['alt'] != '' )})
            record.errors.add(attribute,:H53_descriptive_content_missing, element: element.to_html)
          end
        end
      end
    end
  end
end
