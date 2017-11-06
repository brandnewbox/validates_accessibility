module ValidatesAccessibility
  module Standards
    class H65
      def self.validate(record, attribute, doc)
        elements = Array.new
        doc.css("input").each do |input|
          if input.parent.detect {|c| !c.is_a?(Nokogiri::XML::Label)}
            return
          else
            if doc.css("label[for='#{input["id"]}']").any?
              return
            else
              elements.push(input)
          end
        end

        elements.each do |element|
          doc.css("#{element}[title='']").each do |element|
            record.errors.add(attribute,:a_title_empty, element: element.to_html)
          end
          doc.css("#{element}:not([title])").each do |element|
            record.errors.add(attribute,:a_title_missing, element: element.to_html)
          end
        end
      end
    end
  end
end
end