module ValidatesAccessibility
  module Standards
    class H32
      def self.validate(record, attribute, doc)
        doc.css("form").each do |form|
          if form.children.detect {|c| c.name == "input" && c['type'] == 'submit'}  || form.children.detect {|c| c.name == "button" && c['type'] == 'submit'}
            return # valid option
          else
            record.errors.add(attribute,:H32_form_submit_missing, form: form.to_html)
          end
        end
      end
    end
  end
end
