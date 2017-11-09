module ValidatesAccessibility
  module Standards
    class H24
      def self.validate(record, attribute, doc)
        doc.css("area").each do |area|
          if area['alt'] == ''
            record.errors.add(attribute,:a_area_alt_empty, area: area.to_html)
          elsif area['alt'] == nil
            record.errors.add(attribute,:a_area_alt_missing, area: area.to_html)
          else
            return # valid!
          end
        end
      end
    end
  end
end
