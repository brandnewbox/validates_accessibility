module ValidatesAccessibility
  module Standards
    class H30
      def self.validate(record, attribute, doc)
        doc.css("a").each do |link|
          if link.xpath('text()').any? || link.detect {link.xpath('text()')}
            return # Valid option

          elsif link.children.detect {|c| c.name == 'img' && c['alt'] != '' && c['alt'] != nil}
            link.children.inspect
            return # Valid option

          else
            record.errors.add(attribute,:a_link_content_missing, link: link.to_html)
          end
        end
      end
    end
  end
end
