module ValidatesAccessibility
  module Standards
    class H62
      def self.validate(record, attribute, doc)
        doc.css("ruby").each do |ruby|
          rbs = 0
          rts = 0
          rps = 0
          ruby.children.each do |element|
            if element.name == 'rb'
              rbs += 1
            elsif element.name == 'rt'
              rts += 1
            elsif element.name == 'rp'
              rps += 1
            end
            element.children.each do |child|
              if child.name == 'rb'
                rbs += 1
              elsif child.name == 'rt'
                rts += 1
              elsif child.name == 'rp'
                rps += 1
              end
            end
          end
          if rbs != rts || rps < 1
            record.errors.add(attribute,:H62_ruby_tag_error, ruby: ruby.to_html) 
          end
        end
      end
    end
  end
end
