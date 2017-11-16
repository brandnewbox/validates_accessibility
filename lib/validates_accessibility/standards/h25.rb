module ValidatesAccessibility
  module Standards
    class H25
      def self.validate(record, attribute, doc)
        doc.css("head").each do |head|
          if !head.children.detect {|c| c.name == "title" && c.children[0].is_a?(Nokogiri::XML::Text)}
            record.errors.add(attribute,:H25_page_title_missing, head: head.to_html)
          end
        end
      end
    end
  end
end
