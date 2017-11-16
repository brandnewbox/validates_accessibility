module ValidatesAccessibility
  module Standards
    class H63
      def self.validate(record, attribute, doc)
        elements = Array.new
        doc.css("th").each do |tableHeader|
          if tableHeader['scope'] != 'row' && tableHeader['scope'] != 'col' && tableHeader['scope'] != 'rowgroup' && tableHeader['scope'] != 'colgroup'
            record.errors.add(attribute,:H63_table_header_scope_missing, tableHeader: tableHeader.to_html)
          end
        end
      end
    end
  end
end