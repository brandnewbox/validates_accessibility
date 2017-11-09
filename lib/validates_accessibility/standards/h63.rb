module ValidatesAccessibility
  module Standards
    class H63
      def self.validate(record, attribute, doc)
        elements = Array.new
        doc.css("tableHeader").each do |tableHeader|
          if tableHeader['scope'] != 'row' && tableHeader['scope'] != 'col' && tableHeader['scope'] != 'rowgroup' && tableHeader['scope'] != 'colgroup'
            record.errors.add(attribute,:a_table_header_caption_missing, tableHeader: tableHeader.to_html)
          end
        end
      end
    end
  end
end