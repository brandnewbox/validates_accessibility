module ValidatesAccessibility
  module Standards
    class H46
      def self.validate(record, attribute, doc)
        doc.css("embed").each do |element|       
          if element.next_element && element.next_element.name == 'noembed'
            #valid option
          elsif element.children && element.children.detect {|c| c.name == 'noembed'}
            #valid option
          else
            record.errors.add(attribute,:H46_noembed_missing, element: element.to_html)
          end
        end
      end
    end
  end
end
