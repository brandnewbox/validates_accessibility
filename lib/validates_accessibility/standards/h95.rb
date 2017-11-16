module ValidatesAccessibility
  module Standards
    class H95
      def self.validate(record, attribute, doc)
        elements = Array.new
        doc.css("video").each do |video|
          if !video.children.detect {|c| c.name == 'track' && c['kind'] == 'captions'}
            record.errors.add(attribute,:H95_video_title_missing_captions, video: video.to_html)
          end
        end
      end
    end
  end
end