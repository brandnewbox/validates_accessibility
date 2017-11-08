module ValidatesAccessibility
  module Standards
    class H65
      def self.validate(record, attribute, doc)
        elements = Array.new
        doc.css("input").each do |input|
          if input.parent.name == 'label'
            return # valid option
          elsif doc.css("label[for='#{input["id"]}']").any?
            return # valid option
          elsif input['title']
            return # valid option
          else
            record.errors.add(attribute,:a_title_empty, input: input.to_html)
          end
        end
      end
    end
  end
end