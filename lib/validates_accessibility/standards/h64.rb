module ValidatesAccessibility
  module Standards
    class H64
      def self.validate(record, attribute, doc)
        elements = Array.new
        doc.css("iframe").each do |iframe|
          if iframe['title'] == '' || iframe['title'] == nil
            record.errors.add(attribute,:a_iframe_title_missing, iframe: iframe.to_html)
          end
        end

        doc.css("frame").each do |frame|
          if frame['title'] == '' || frame['title'] == nil
            record.errors.add(attribute,:a_frame_title_missing, frame: frame.to_html)
          end
        end
      end
    end
  end
end