module ValidatesAccessibility
  module Standards
    class H96
      def self.validate(record, attribute, doc)
        elements = Array.new
        doc.css("video").each do |video|
          if !video.children.detect {|c| c.name == 'track' && c['kind'] == 'descriptions'}
            record.errors.add(attribute,:a_video_title_missing, video: video.to_html)
          end
        end
      end
    end
  end
end