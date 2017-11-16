module ValidatesAccessibility
  module Standards
    class H91
      def self.validate(record, attribute, doc)
        doc.css("input").each do |input|
          if input['type'] == 'button' || input['type'] == 'submit' || input['type'] == 'reset' || input['type'] == 'file'
            if input['value'] == nil || input['value'] == ''
              return record.errors.add(attribute,:H91_input_value_missing, input: input.to_html)
            end
          end
        end

        doc.css("select").each do |selectTag|
          hasSelectedChild = false
          selectTag.children.each do |option|
            if option['selected'] == 'selected'
              hasSelectedChild = true
            end
          end
          if !hasSelectedChild
            record.errors.add(attribute,:H91_select_on_option_selected, selectTag: selectTag.to_html)
          end
        end
      end
    end
  end
end