module ValidatesAccessibility
  module Standards
    class H76
      def self.validate(record, attribute, doc)
        doc.css("meta").each do |meta|
          if meta['http-equiv'] == nil
            return record.errors.add(attribute,:meta_http_equiv_error, meta: meta.to_html)
          elsif meta['http-equiv'].downcase == 'refresh'
            return # valid option
          else
            return record.errors.add(attribute,:meta_http_equiv_error, meta: meta.to_html)
          end
        end
      end
    end
  end
end