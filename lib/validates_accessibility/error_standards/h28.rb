module ValidatesAccessibility
  module Standards
    class H28
      def self.validate(record, attribute, doc)
        doc.css("abbr").each do |abbr|
          if abbr['title'] == nil || abbr['title'] == ''
            record.errors.add(attribute,:H28_abbr_title_missing, abbr: abbr.to_html)
          end
        end
      end
    end
  end
end
