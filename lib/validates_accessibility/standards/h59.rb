module ValidatesAccessibility
  module Standards
    class H59
      def self.validate(record, attribute, doc)
        doc.css("head").each do |head|
          if head.children.detect {|c| c.name == 'link' && ((c['rel'] == '' || c['rel'] == nil) || (c['href'] == '' || c['href'] == nil))}
            record.errors.add(attribute,:a_head_link_rel_missing, head: head.to_html) 
          end
        end
      end
    end
  end
end
