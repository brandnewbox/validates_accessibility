module WarningValidator
  module Standards
    class H69
      def self.validate(record, attribute, doc)
        doc.css("h1").each do |h1|
          if h1
            return # has at least 1 header
          end
        end
        doc.css("h2").each do |h2|
          if h2
            return # has at least 1 header
          end
        end
        doc.css("h3").each do |h3|
          if h3
            return # has at least 1 header
          end
        end
        doc.css("h4").each do |h4|
          if h4
            return # has at least 1 header
          end
        end
        doc.css("h5").each do |h5|
          if h5
            return # has at least 1 header
          end
        end
        doc.css("h6").each do |h6|
          if h6
            return # has at least 1 header
          end
        end
        record.errors.add(attribute,:H69_content_header_missing)
      end
    end
  end
end