module ValidatesAccessibility
  module Standards
    class H39
      def self.validate(record, attribute, doc)
        elements = Array.new
        doc.css("table").each do |table|
          if !table.children.detect {|c| c.name == 'caption' && c.is_a?(Nokogiri::XML::Text)}
          end
        end
      end
    end
  end
end