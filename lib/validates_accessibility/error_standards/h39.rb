module ValidatesAccessibility
  module Standards
    class H39
      def self.validate(record, attribute, doc)
        elements = Array.new
        doc.css("table").each do |table|
          if !table.children.detect {|c| c.children[0].is_a?(Nokogiri::XML::Text) && c.name = 'caption'}
            record.errors.add(attribute,:H39_table_caption_missing, table: table.to_html)
          end
        end
      end
    end
  end
end