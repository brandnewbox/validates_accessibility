module ValidatesAccessibility
  module Standards
    class H73
      def self.validate(record, attribute, doc)
        doc.css("table").each do |table|
          if table['summary'] == ''
            return record.errors.add(attribute,:H73_table_summary_empty, table: table.to_html)
          end
          if table['summary'] != nil
            table.css("caption").each do |caption|
              if caption.text == table['summary']
                return record.errors.add(attribute,:H73_table_summary_matches_caption, table: table.to_html)        
              end
            end
          end
        end
      end
    end
  end
end