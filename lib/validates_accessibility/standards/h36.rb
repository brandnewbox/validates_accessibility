module ValidatesAccessibility
  module Standards
    class H36
      def self.validate(record, attribute, doc)
        doc.css("input").each do |input|
          
          if input['type'] == 'image' && input['alt'] != nil && input['alt'] != ''
            return #valid option
          elsif input['type'] == 'image' && (input['alt'] == nil || input['alt'] == '')
            record.errors.add(attribute,:a_input_type_image_alt_missing, input: input.to_html) 
          else
            return # does not have type image
          end
        end
      end
    end
  end
end
