module ValidatesAccessibility
  module Standards
    class H57
      def self.validate(record, attribute, doc)
        doc.css("html").each do |html|
          if (html['lang'] == '' || html['lang'] == nil) && (html['xml:lang'] == '' || html['xml:lang'] == nil )
            record.errors.add(attribute,:a_html_lang_missing, html: html.to_html) 

          end
        end
      end
    end
  end
end
